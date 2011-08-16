
require 'csv'
require 'iconv'


namespace :postcodes do
  desc "import a list of things from a CSV file"
  task :import, [:file_name] => :environment do |t, args|

    file_path = File.join(File.dirname(__FILE__), '..', '..', 'tmp', 'source_data', "ONSPD_FEB_2011_UK_O.csv")


    postcode_type = AreaType.find_by_name!("Postcode")
    postcode_area_type = AreaType.find_by_name!("Postcode Area")
    postcode_sector_type = AreaType.find_by_name!("Postcode Sector")
    postcode_district_type = AreaType.find_by_name!("Postcode District")


    counter = 1
    file = File.new(file_path, "r")
    while (line = file.gets)

      csv = CSV.parse(line)

      pc = csv[0][2] # Use third version of postcode as this always contains a single space

      postcode_area_regex = /\A([A-Z]+)/
      postcode_district_regex = /\A([A-Z\d]+)/

      pc_area = postcode_area_regex.match(pc)[0]
      pc_district = postcode_district_regex.match(pc)[0]

      postcode_area = Area.find_or_create_by_name_and_area_type_id(pc_area, postcode_area_type.id)
      postcode_district = Area.find_or_create_by_name_and_area_type_id(pc_district, postcode_district_type.id)


      parent_areas = [postcode_area]

      [csv[0][5], csv[0][6], csv[0][14], csv[0][15]].each do |code|

        if !code.blank? && !(code =~ /\A[EWSLM]99999999\Z/)
          parent_area = Area.find_by_ons_code(code)
          if parent_area
            parent_areas << parent_area
          end
        end
      end

      #postcode = Area.create(:name => pc.gsub(" ", ""), :area_type => postcode_type, :parents => parent_areas)

      parent_areas.each do |parent_area|
        postcode_district.parents << parent_area unless postcode_district.parents.include?(parent_area)
      end

      puts counter
      counter = counter + 1
    end

    file.close


  end
end
