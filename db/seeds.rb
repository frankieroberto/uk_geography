
  # Countries
  country = AreaType.create(:name => "Country")

  england = Area.create(:name => "England", :ons_code => "E92000001", :area_type => country, :population => 52234045)
  scotland = Area.create(:name => "Scotland", :ons_code => "S92000003", :area_type => country, :population => 5222100)
  wales = Area.create(:name => "Wales", :ons_code => "W92000004", :area_type => country, :population => 3006430)
  northern_ireland = Area.create(:name => "Northern Ireland", :ons_code => "N92000002", :area_type => country, :population => 1799392)

  # English Regions
  region = AreaType.create(:name => "Region")

  [
    {:ons_code => "E12000001", :name => "North East", :population => 2606625},
    {:ons_code => "E12000002", :name => "North West", :population => 6935736},
    {:ons_code => "E12000003", :name => "Yorkshire and The Humber", :population => 5301252},
    {:ons_code => "E12000004", :name => "East Midlands", :population => 4481431},
    {:ons_code => "E12000005", :name => "West Midlands", :population => 5455179},
    {:ons_code => "E12000006", :name => "East", :population => 5831845},
    {:ons_code => "E12000008", :name => "South East", :population => 8523074},
    {:ons_code => "E12000009", :name => "South West", :population => 5273726}
  ].each do |a|
    area = Area.create(:name => a[:name], :ons_code => a[:ons_code], :area_type => region)
    area.parents << england
  end

  london = Area.create(:name => "London", :area_type => region, :ons_code => "E12000007", :parents => [england], :population => 7825177)



  # English Counties
  county = AreaType.create(:name => "County")

  [
  {:ons_code => "E10000001", :name => "Bedfordshire", :population => 416016, :region => "East"},
  {:ons_code => "E10000002", :name => "Buckinghamshire", :population => 498072, :region => "South East"},
  {:ons_code => "E10000003", :name => "Cambridgeshire", :population => 616282, :region => "East"},
  {:ons_code => "E10000004", :name => "Cheshire", :population => 691120, :region => "North West"},
  {:ons_code => "E10000005", :name => "Cornwall and Isles of Scilly", :population => 537445, :region => "South West"},
  {:ons_code => "E10000006", :name => "Cumbria", :population => 494350, :region => "North West"},
  {:ons_code => "E10000007", :name => "Derbyshire", :population => 763724, :region => "East Midlands"},
  {:ons_code => "E10000008", :name => "Devon", :population => 749944, :region => "South West"},
  {:ons_code => "E10000009", :name => "Dorset", :population => 404789, :region => "South West"},
  {:ons_code => "E10000010", :name => "Durham", :population => 510804, :region => "North East"},
  {:ons_code => "E10000011", :name => "East Sussex", :population => 515522, :region => "South East"},
  {:ons_code => "E10000012", :name => "Essex", :population => 1413025, :region => "East"},
  {:ons_code => "E10000013", :name => "Gloucestershire", :population => 593527, :region => "South West"},
  {:ons_code => "E10000014", :name => "Hampshire", :population => 1296814, :region => "South East"},
  {:ons_code => "E10000015", :name => "Hertfordshire", :population => 1107521, :region => "East"},
  {:ons_code => "E10000016", :name => "Kent", :population => 1427418, :region => "South East"},
  {:ons_code => "E10000017", :name => "Lancashire", :population => 1169270, :region => "North West"},
  {:ons_code => "E10000018", :name => "Leicestershire", :population => 648748, :region => "East Midlands"},
  {:ons_code => "E10000019", :name => "Lincolnshire", :population => 703008, :region => "East Midlands"},
  {:ons_code => "E10000020", :name => "Norfolk", :population => 862346, :region => "East"},
  {:ons_code => "E10000021", :name => "Northamptonshire", :population => 687319, :region => "East Midlands"},
  {:ons_code => "E10000022", :name => "Northumberland", :population => 311991, :region => "North East"},
  {:ons_code => "E10000023", :name => "North Yorkshire", :population => 599708, :region => "Yorkshire and The Humber"},
  {:ons_code => "E10000024", :name => "Nottinghamshire", :population => 779890, :region => "East Midlands"},
  {:ons_code => "E10000025", :name => "Oxfordshire", :population => 648722, :region => "South East"},
  {:ons_code => "E10000026", :name => "Shropshire", :population => 293378, :region => "West Midlands"},
  {:ons_code => "E10000027", :name => "Somerset", :population => 525186, :region => "South West"},
  {:ons_code => "E10000028", :name => "Staffordshire", :population => 831290, :region => "West Midlands"},
  {:ons_code => "E10000029", :name => "Suffolk", :population => 719511, :region => "East"},
  {:ons_code => "E10000030", :name => "Surrey", :population => 1127322, :region => "South East"},
  {:ons_code => "E10000031", :name => "Warwickshire", :population => 535982, :region => "West Midlands"},
  {:ons_code => "E10000032", :name => "West Sussex", :population => 799701, :region => "South East"},
  {:ons_code => "E10000033", :name => "Wiltshire", :population => 459835, :region => "South West"},
  {:ons_code => "E10000034", :name => "Worcestershire", :population => 557426, :region => "West Midlands"}
  ].each do |a|
    region = Area.find_by_name!(a[:region])
    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :area_type => county, :population => a[:population], :parents => [region, england])
  end



  ua = AreaType.create(:name => "Unitary Authority")

  [{:ons_code => "E06000001", :name => "Hartlepool", :region => "North East", :population => "91304"},
  {:ons_code => "E06000002", :name => "Middlesbrough", :region => "North East", :population => "142370"},
  {:ons_code => "E06000003", :name => "Redcar and Cleveland", :region => "North East", :population => "137398"},
  {:ons_code => "E06000004", :name => "Stockton-on-Tees", :region => "North East", :population => "192389"},
  {:ons_code => "E06000005", :name => "Darlington", :region => "North East", :population => "100843"},
  {:ons_code => "E06000006", :name => "Halton", :region => "North West", :population => "119263"},
  {:ons_code => "E06000007", :name => "Warrington", :region => "North West", :population => "198905"},
  {:ons_code => "E06000008", :name => "Blackburn with Darwen", :region => "North West", :population => "140045"},
  {:ons_code => "E06000009", :name => "Blackpool", :region => "North West", :population => "139974"},
  {:ons_code => "E06000010", :name => "Kingston upon Hull, City of", :region => "Yorkshire and The Humber", :population => "263890"},
  {:ons_code => "E06000011", :name => "East Riding of Yorkshire", :region => "Yorkshire and The Humber", :population => "338690"},
  {:ons_code => "E06000012", :name => "North East Lincolnshire", :region => "Yorkshire and The Humber", :population => "157314"},
  {:ons_code => "E06000013", :name => "North Lincolnshire", :region => "Yorkshire and The Humber", :population => "161345"},
  {:ons_code => "E06000014", :name => "York", :region => "Yorkshire and The Humber", :population => "202447"},
  {:ons_code => "E06000015", :name => "Derby", :region => "East Midlands", :population => "246855"},
  {:ons_code => "E06000016", :name => "Leicester", :region => "East Midlands", :population => "306631"},
  {:ons_code => "E06000017", :name => "Rutland", :region => "East Midlands", :population => "38559"},
  {:ons_code => "E06000018", :name => "Nottingham", :region => "East Midlands", :population => "306697"},
  {:ons_code => "E06000019", :name => "Herefordshire, County of", :region => "West Midlands", :population => "179297"},
  {:ons_code => "E06000020", :name => "Telford and Wrekin", :region => "West Midlands", :population => "162613"},
  {:ons_code => "E06000021", :name => "Stoke-on-Trent", :region => "West Midlands", :population => "240072"},
  {:ons_code => "E06000022", :name => "Bath and North East Somerset", :region => "South West", :population => "179704"},
  {:ons_code => "E06000023", :name => "Bristol, City of", :region => "South West", :population => "441285"},
  {:ons_code => "E06000024", :name => "North Somerset", :region => "South West", :population => "212194"},
  {:ons_code => "E06000025", :name => "South Gloucestershire", :region => "South West", :population => "264826"},
  {:ons_code => "E06000026", :name => "Plymouth", :region => "South West", :population => "258710"},
  {:ons_code => "E06000027", :name => "Torbay", :region => "South West", :population => "134271"},
  {:ons_code => "E06000028", :name => "Bournemouth", :region => "South West", :population => "168118"},
  {:ons_code => "E06000029", :name => "Poole", :region => "South West", :population => "142135"},
  {:ons_code => "E06000030", :name => "Swindon", :region => "South West", :population => "201757"},
  {:ons_code => "E06000031", :name => "Peterborough", :region => "East", :population => "173423"},
  {:ons_code => "E06000032", :name => "Luton", :region => "East", :population => "198752"},
  {:ons_code => "E06000033", :name => "Southend-on-Sea", :region => "East", :population => "165311"},
  {:ons_code => "E06000034", :name => "Thurrock", :region => "East", :population => "159658"},
  {:ons_code => "E06000035", :name => "Medway", :region => "South East", :population => "256699"},
  {:ons_code => "E06000036", :name => "Bracknell Forest", :region => "South East", :population => "116538"},
  {:ons_code => "E06000037", :name => "West Berkshire", :region => "South East", :population => "153975"},
  {:ons_code => "E06000038", :name => "Reading", :region => "South East", :population => "154234"},
  {:ons_code => "E06000039", :name => "Slough", :region => "South East", :population => "131084"},
  {:ons_code => "E06000040", :name => "Windsor and Maidenhead", :region => "South East", :population => "146148"},
  {:ons_code => "E06000041", :name => "Wokingham", :region => "South East", :population => "163222"},
  {:ons_code => "E06000042", :name => "Milton Keynes", :region => "South East", :population => "241497"},
  {:ons_code => "E06000043", :name => "Brighton and Hove", :region => "South East", :population => "258762"},
  {:ons_code => "E06000044", :name => "Portsmouth", :region => "South East", :population => "207121"},
  {:ons_code => "E06000045", :name => "Southampton", :region => "South East", :population => "239732"},
  {:ons_code => "E06000046", :name => "Isle of Wight", :region => "South East", :population => "140491"},
  {:ons_code => "E06000047", :name => "County Durham", :region => "North East", :population => "510804"},
  {:ons_code => "E06000048", :name => "Northumberland", :region => "North East", :population => "311991"},
  {:ons_code => "E06000049", :name => "Cheshire East", :region => "North West", :population => "363820"},
  {:ons_code => "E06000050", :name => "Cheshire West and Chester", :region => "North West", :population => "327300"},
  {:ons_code => "E06000051", :name => "Shropshire", :region => "West Midlands", :population => "293378"},
  {:ons_code => "E06000052", :name => "Cornwall", :region => "South West", :population => "535334"},
  {:ons_code => "E06000053", :name => "Isles of Scilly", :region => "South West", :population => "2111"},
  {:ons_code => "E06000054", :name => "Wiltshire", :region => "South West", :population => "459835"},
  {:ons_code => "E06000055", :name => "Bedford", :region => "East", :population => "160797"},
  {:ons_code => "E06000056", :name => "Central Bedfordshire", :region => "East", :population => "255219"}].each do |a|

    region = Area.find_by_name!(a[:region])
    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :area_type => ua, :parents => [region, england], :population => a[:population])

  end

  [
    {:ons_code => "W06000001", :name => "Isle of Anglesey", :population => "68592"},
    {:ons_Code => "W06000002", :Name => "Gwynedd", :Population => "119007"},
    {:ons_code => "W06000003", :name => "Conwy", :population => "110863"},
    {:ons_code => "W06000004", :name => "Denbighshire", :population => "96731"},
    {:ons_code => "W06000005", :name => "Flintshire", :population => "149709"},
    {:ons_code => "W06000006", :name => "Wrexham", :population => "33559"},
    {:ons_code => "W06000023", :name => "Powys", :population => "131313"},
    {:ons_code => "W06000008", :name => "Ceredigion", :population => "76938"},
    {:ons_code => "W06000009", :name => "Pembrokeshire", :population => "117086"},
    {:ons_code => "W06000010", :name => "Carmarthenshire", :population => "180717"},
    {:ons_code => "W06000011", :name => "Swansea", :population => "232501"},
    {:ons_code => "W06000012", :name => "Neath Port Talbot", :population => "137392"},
    {:ons_code => "W06000013", :name => "Bridgend", :population => "134564"},
    {:ons_code => "W06000014", :name => "The Vale of Glamorgan", :population => "124976"},
    {:ons_code => "W06000015", :name => "Cardiff", :population => "341054"},
    {:ons_code => "W06000016", :name => "Rhondda, Cynon, Taff", :population => "234309"},
    {:ons_code => "W06000024", :name => "Merthyr Tydfil", :population => "55699"},
    {:ons_code => "W06000018", :name => "Caerphilly", :population => "173124"},
    {:ons_code => "W06000019", :name => "Blaenau Gwent", :population => "68368"},
    {:ons_code => "W06000020", :name => "Torfaen", :population => "90533"},
    {:ons_code => "W06000021", :name => "Monmouthshire", :population => "88089"},
    {:ons_code => "W06000022", :name => "Newport", :population => "141306"},
  ].each do |a|

    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :area_type => ua, :parents => [wales], :population => a[:population])

  end

  [
  {:ons_code => "95T", :name => "Antrim", :population => 54145},
  {:ons_code => "95X", :name => "Ards", :population => 78248},
  {:ons_code => "95O", :name => "Armagh", :population => 59441},
  {:ons_code => "95G", :name => "Ballymena", :population => 63451},
  {:ons_code => "95D", :name => "Ballymoney", :population => 30564},
  {:ons_code => "95Q", :name => "Banbridge", :population => 47955},
  {:ons_code => "95Z", :name => "Belfast", :population => 268745},
  {:ons_code => "95V", :name => "Carrickfergus", :population => 40158},
  {:ons_code => "95Y", :name => "Castlereagh", :population => 67029},
  {:ons_code => "95C", :name => "Coleraine", :population => 56790},
  {:ons_code => "95I", :name => "Cookstown", :population => 36655},
  {:ons_code => "95N", :name => "Craigavon", :population => 93623},
  {:ons_code => "95A", :name => "Derry", :population => 109826},
  {:ons_code => "95R", :name => "Down", :population => 70770},
  {:ons_code => "95M", :name => "Dungannon", :population => 57748},
  {:ons_code => "95L", :name => "Fermanagh", :population => 63076},
  {:ons_code => "95F", :name => "Larne", :population => 31650},
  {:ons_code => "95B", :name => "Limavady", :population => 33564},
  {:ons_code => "95S", :name => "Lisburn", :population => 117836},
  {:ons_code => "95H", :name => "Magherafelt", :population => 44730},
  {:ons_code => "95E", :name => "Moyle", :population => 16998},
  {:ons_code => "95P", :name => "Newry & Mourne", :population => 99880},
  {:ons_code => "95U", :name => "Newtownabbey", :population => 83605},
  {:ons_code => "95W", :name => "North Down", :population => 79940},
  {:ons_code => "95K", :name => "Omagh", :population => 52866},
  {:ons_code => "95J", :name => "Strabane", :population => 40099}
  ].each do |a|

    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :area_type => ua, :parents => [northern_ireland], :population => a[:population])

  end


  nmd = AreaType.create(:name => "Non-metropolitan District")

  [
  {:ons_code => "E07000004", :name => "Aylesbury Vale", :region => "South East", :county => "Buckinghamshire", :population => 174409},
  {:ons_code => "E07000005", :name => "Chiltern", :region => "South East", :county => "Buckinghamshire", :population => 91381},
  {:ons_code => "E07000006", :name => "South Bucks", :region => "South East", :county => "Buckinghamshire", :population => 67477},
  {:ons_code => "E07000007", :name => "Wycombe", :region => "South East", :county => "Buckinghamshire", :population => 164805},
  {:ons_code => "E07000008", :name => "Cambridge", :region => "East", :county => "Cambridgeshire", :population => 125717},
  {:ons_code => "E07000009", :name => "East Cambridgeshire", :region => "East", :county => "Cambridgeshire", :population => 84931},
  {:ons_code => "E07000010", :name => "Fenland", :region => "East", :county => "Cambridgeshire", :population => 91927},
  {:ons_code => "E07000011", :name => "Huntingdonshire", :region => "East", :county => "Cambridgeshire", :population => 167301},
  {:ons_code => "E07000012", :name => "South Cambridgeshire", :region => "East", :county => "Cambridgeshire", :population => 146406},
  {:ons_code => "E07000026", :name => "Allerdale", :region => "North West", :county => "Cumbria", :population => 94086},
  {:ons_code => "E07000027", :name => "Barrow-in-Furness", :region => "North West", :county => "Cumbria", :population => 70654},
  {:ons_code => "E07000028", :name => "Carlisle", :region => "North West", :county => "Cumbria", :population => 104539},
  {:ons_code => "E07000029", :name => "Copeland", :region => "North West", :county => "Cumbria", :population => 69513},
  {:ons_code => "E07000030", :name => "Eden", :region => "North West", :county => "Cumbria", :population => 51817},
  {:ons_code => "E07000031", :name => "South Lakeland", :region => "North West", :county => "Cumbria", :population => 103741},
  {:ons_code => "E07000032", :name => "Amber Valley", :region => "North West", :county => "Derbyshire", :population => 121590},
  {:ons_code => "E07000033", :name => "Bolsover", :region => "North West", :county => "Derbyshire", :population => 74572},
  {:ons_code => "E07000034", :name => "Chesterfield", :region => "North West", :county => "Derbyshire", :population => 101036},
  {:ons_code => "E07000035", :name => "Derbyshire Dales", :region => "North West", :county => "Derbyshire", :population => 70389},
  {:ons_code => "E07000036", :name => "Erewash", :region => "North West", :county => "Derbyshire", :population => 111300},
  {:ons_code => "E07000037", :name => "High Peak", :region => "North West", :county => "Derbyshire", :population => 92609},
  {:ons_code => "E07000038", :name => "North East Derbyshire", :region => "North West", :county => "Derbyshire", :population => 98315},
  {:ons_code => "E07000039", :name => "South Derbyshire", :region => "North West", :county => "Derbyshire", :population => 93913},
  {:ons_code => "E07000040", :name => "East Devon", :region => "South West", :county => "Devon", :population => 132857},
  {:ons_code => "E07000041", :name => "Exeter", :region => "South West", :region => "South West", :county => "Devon", :population => 119618},
  {:ons_code => "E07000042", :name => "Mid Devon", :region => "South West", :region => "South West", :county => "Devon", :population => 76088},
  {:ons_code => "E07000043", :name => "North Devon", :region => "South West", :region => "South West", :county => "Devon", :population => 91472},
  {:ons_code => "E07000044", :name => "South Hams", :region => "South West", :region => "South West", :county => "Devon", :population => 83724},
  {:ons_code => "E07000045", :name => "Teignbridge", :region => "South West", :county => "Devon", :population => 127291},
  {:ons_code => "E07000046", :name => "Torridge", :region => "South West", :county => "Devon", :population => 65831},
  {:ons_code => "E07000047", :name => "West Devon", :region => "South West", :county => "Devon", :population => 53063},
  {:ons_code => "E07000048", :name => "Christchurch", :region => "South West", :county => "Dorset", :population => 47302},
  {:ons_code => "E07000049", :name => "East Dorset", :region => "South West", :county => "Dorset", :population => 87828},
  {:ons_code => "E07000050", :name => "North Dorset", :region => "South West", :county => "Dorset", :population => 64225},
  {:ons_code => "E07000051", :name => "Purbeck", :region => "South West", :county => "Dorset", :population => 45190},
  {:ons_code => "E07000052", :name => "West Dorset", :region => "South West", :county => "Dorset", :population => 96712},
  {:ons_code => "E07000053", :name => "Weymouth and Portland", :region => "South West", :county => "Dorset", :population => 63532},
  {:ons_code => "E07000061", :name => "Eastbourne", :region => "South East", :county => "East Sussex", :population => 96972},
  {:ons_code => "E07000062", :name => "Hastings", :region => "South East", :county => "East Sussex", :population => 87171},
  {:ons_code => "E07000063", :name => "Lewes", :region => "South East", :county => "East Sussex", :population => 97466},
  {:ons_code => "E07000064", :name => "Rother", :region => "South East", :county => "East Sussex", :population => 89817},
  {:ons_code => "E07000065", :name => "Wealden", :region => "South East", :county => "East Sussex", :population => 144096},
  {:ons_code => "E07000066", :name => "Basildon", :region => "East", :county => "Essex", :population => 175212},
  {:ons_code => "E07000067", :name => "Braintree", :region => "East", :county => "Essex", :population => 144032},
  {:ons_code => "E07000068", :name => "Brentwood", :region => "East", :county => "Essex", :population => 74785},
  {:ons_code => "E07000069", :name => "Castle Point", :region => "East", :county => "Essex", :population => 89402},
  {:ons_code => "E07000070", :name => "Chelmsford", :region => "East", :county => "Essex", :population => 169542},
  {:ons_code => "E07000071", :name => "Colchester", :region => "East", :county => "Essex", :population => 181016},
  {:ons_code => "E07000072", :name => "Epping Forest", :region => "East", :county => "Essex", :population => 124738},
  {:ons_code => "E07000073", :name => "Harlow", :region => "East", :county => "Essex", :population => 81658},
  {:ons_code => "E07000074", :name => "Maldon", :region => "East", :county => "Essex", :population => 63242},
  {:ons_code => "E07000075", :name => "Rochford", :region => "East", :county => "Essex", :population => 83354},
  {:ons_code => "E07000076", :name => "Tendring", :region => "East", :county => "Essex", :population => 148543},
  {:ons_code => "E07000077", :name => "Uttlesford", :region => "East", :county => "Essex", :population => 77501},
  {:ons_code => "E07000078", :name => "Cheltenham", :region => "South West", :county => "Gloucestershire", :population => 115263},
  {:ons_code => "E07000079", :name => "Cotswold", :region => "South West", :county => "Gloucestershire", :population => 83538},
  {:ons_code => "E07000080", :name => "Forest of Dean", :region => "South West", :county => "Gloucestershire", :population => 82879},
  {:ons_code => "E07000081", :name => "Gloucester", :region => "South West", :county => "Gloucestershire", :population => 118440},
  {:ons_code => "E07000082", :name => "Stroud", :region => "South West", :county => "Gloucestershire", :population => 111717},
  {:ons_code => "E07000083", :name => "Tewkesbury", :region => "South West", :county => "Gloucestershire", :population => 81690},
  {:ons_code => "E07000084", :name => "Basingstoke and Deane", :region => "South East", :county => "Hampshire", :population => 165120},
  {:ons_code => "E07000085", :name => "East Hampshire", :region => "South East", :county => "Hampshire", :population => 112578},
  {:ons_code => "E07000086", :name => "Eastleigh", :region => "South East", :county => "Hampshire", :population => 122370},
  {:ons_code => "E07000087", :name => "Fareham", :region => "South East", :county => "Hampshire", :population => 112108},
  {:ons_code => "E07000088", :name => "Gosport", :region => "South East", :county => "Hampshire", :population => 79892},
  {:ons_code => "E07000089", :name => "Hart", :region => "South East", :county => "Hampshire", :population => 91189},
  {:ons_code => "E07000090", :name => "Havant", :region => "South East", :county => "Hampshire", :population => 116841},
  {:ons_code => "E07000091", :name => "New Forest", :region => "South East", :county => "Hampshire", :population => 177021},
  {:ons_code => "E07000092", :name => "Rushmoor", :region => "South East", :county => "Hampshire", :population => 91978},
  {:ons_code => "E07000093", :name => "Test Valley", :region => "South East", :county => "Hampshire", :population => 113465},
  {:ons_code => "E07000094", :name => "Winchester", :region => "South East", :county => "Hampshire", :population => 114252},
  {:ons_code => "E07000095", :name => "Broxbourne", :region => "East", :county => "Hertfordshire", :population => 90609},
  {:ons_code => "E07000096", :name => "Dacorum", :region => "East", :county => "Hertfordshire", :population => 142881},
  {:ons_code => "E07000097", :name => "East Hertfordshire", :region => "East", :county => "Hertfordshire", :population => 138476},
  {:ons_code => "E07000098", :name => "Hertsmere", :region => "East", :county => "Hertfordshire", :population => 99924},
  {:ons_code => "E07000099", :name => "North Hertfordshire", :region => "East", :county => "Hertfordshire", :population => 125809},
  {:ons_code => "E07000100", :name => "St Albans", :region => "East", :county => "Hertfordshire", :population => 138753},
  {:ons_code => "E07000101", :name => "Stevenage", :region => "East", :county => "Hertfordshire", :population => 81766},
  {:ons_code => "E07000102", :name => "Three Rivers", :region => "East", :county => "Hertfordshire", :population => 88932},
  {:ons_code => "E07000103", :name => "Watford", :region => "East", :county => "Hertfordshire", :population => 86003},
  {:ons_code => "E07000104", :name => "Welwyn Hatfield", :region => "East", :county => "Hertfordshire", :population => 114368},
  {:ons_code => "E07000105", :name => "Ashford", :region => "South East", :county => "Kent", :population => 115533},
  {:ons_code => "E07000106", :name => "Canterbury", :region => "South East", :county => "Kent", :population => 153189},
  {:ons_code => "E07000107", :name => "Dartford", :region => "South East", :county => "Kent", :population => 94555},
  {:ons_code => "E07000108", :name => "Dover", :region => "South East", :county => "Kent", :population => 106931},
  {:ons_code => "E07000109", :name => "Gravesham", :region => "South East", :county => "Kent", :population => 99551},
  {:ons_code => "E07000110", :name => "Maidstone", :region => "South East", :county => "Kent", :population => 149824},
  {:ons_code => "E07000111", :name => "Sevenoaks", :region => "South East", :county => "Kent", :population => 114087},
  {:ons_code => "E07000112", :name => "Shepway", :region => "South East", :county => "Kent", :population => 101201},
  {:ons_code => "E07000113", :name => "Swale", :region => "South East", :county => "Kent", :population => 133437},
  {:ons_code => "E07000114", :name => "Thanet", :region => "South East", :county => "Kent", :population => 132169},
  {:ons_code => "E07000115", :name => "Tonbridge and Malling", :region => "South East", :county => "Kent", :population => 118768},
  {:ons_code => "E07000116", :name => "Tunbridge Wells", :region => "South East", :county => "Kent", :population => 108173},
  {:ons_code => "E07000117", :name => "Burnley", :region => "North West", :county => "Kent", :population => 85301},
  {:ons_code => "E07000118", :name => "Chorley", :region => "North West", :county => "Kent", :population => 105432},
  {:ons_code => "E07000119", :name => "Fylde", :region => "North West", :county => "Kent", :population => 76590},
  {:ons_code => "E07000120", :name => "Hyndburn", :region => "North West", :county => "Kent", :population => 81122},
  {:ons_code => "E07000121", :name => "Lancaster", :region => "North West", :county => "Kent", :population => 141066},
  {:ons_code => "E07000122", :name => "Pendle", :region => "North West", :county => "Kent", :population => 89283},
  {:ons_code => "E07000123", :name => "Preston", :region => "North West", :county => "Kent", :population => 135081},
  {:ons_code => "E07000124", :name => "Ribble Valley", :region => "North West", :county => "Kent", :population => 57992},
  {:ons_code => "E07000125", :name => "Rossendale", :region => "North West", :county => "Kent", :population => 67396},
  {:ons_code => "E07000126", :name => "South Ribble", :region => "North West", :county => "Kent", :population => 108349},
  {:ons_code => "E07000127", :name => "West Lancashire", :region => "North West", :county => "Kent", :population => 110267},
  {:ons_code => "E07000128", :name => "Wyre", :region => "North West", :county => "Kent", :population => 111391},
  {:ons_code => "E07000129", :name => "Blaby", :region => "East Midlands", :county => "Leicestershire", :population => 94021},
  {:ons_code => "E07000130", :name => "Charnwood", :region => "East Midlands", :county => "Leicestershire", :population => 166827},
  {:ons_code => "E07000131", :name => "Harborough", :region => "East Midlands", :county => "Leicestershire", :population => 84012},
  {:ons_code => "E07000132", :name => "Hinckley and Bosworth", :region => "East Midlands", :county => "Leicestershire", :population => 105082},
  {:ons_code => "E07000133", :name => "Melton", :region => "East Midlands", :county => "Leicestershire", :population => 49475},
  {:ons_code => "E07000134", :name => "North West Leicestershire", :region => "East Midlands", :county => "Leicestershire", :population => 90783},
  {:ons_code => "E07000135", :name => "Oadby and Wigston", :region => "East Midlands", :county => "Leicestershire", :population => 58548},
  {:ons_code => "E07000136", :name => "Boston", :region => "East Midlands", :county => "Lincolnshire", :population => 59042},
  {:ons_code => "E07000137", :name => "East Lindsey", :region => "East Midlands", :county => "Lincolnshire", :population => 141633},
  {:ons_code => "E07000138", :name => "Lincoln", :region => "East Midlands", :county => "Lincolnshire", :population => 89668},
  {:ons_code => "E07000139", :name => "North Kesteven", :region => "East Midlands", :county => "Lincolnshire", :population => 106432},
  {:ons_code => "E07000140", :name => "South Holland", :region => "East Midlands", :county => "Lincolnshire", :population => 84561},
  {:ons_code => "E07000141", :name => "South Kesteven", :region => "East Midlands", :county => "Lincolnshire", :population => 132271},
  {:ons_code => "E07000142", :name => "West Lindsey", :region => "East Midlands", :county => "Lincolnshire", :population => 89401},
  {:ons_code => "E07000143", :name => "Breckland", :region => "East", :county => "Norfolk", :population => 130925},
  {:ons_code => "E07000144", :name => "Broadland", :region => "East", :county => "Norfolk", :population => 123676},
  {:ons_code => "E07000145", :name => "Great Yarmouth", :region => "East", :county => "Norfolk", :population => 97179},
  {:ons_code => "E07000146", :name => "King's Lynn and West Norfolk", :region => "East", :county => "Norfolk", :population => 143631},
  {:ons_code => "E07000147", :name => "North Norfolk", :region => "East", :county => "Norfolk", :population => 101667},
  {:ons_code => "E07000148", :name => "Norwich", :region => "East", :county => "Norfolk", :population => 143488},
  {:ons_code => "E07000149", :name => "South Norfolk", :region => "East", :county => "Norfolk", :population => 121780},
  {:ons_code => "E07000150", :name => "Corby", :region => "East Midlands", :county => "Northamptonshire", :population => 55833},
  {:ons_code => "E07000151", :name => "Daventry", :region => "East Midlands", :county => "Northamptonshire", :population => 78959},
  {:ons_code => "E07000152", :name => "East Northamptonshire", :region => "East Midlands", :county => "Northamptonshire", :population => 85251},
  {:ons_code => "E07000153", :name => "Kettering", :region => "East Midlands", :county => "Northamptonshire", :population => 90631},
  {:ons_code => "E07000154", :name => "Northampton", :region => "East Midlands", :county => "Northamptonshire", :population => 212130},
  {:ons_code => "E07000155", :name => "South Northamptonshire", :region => "East Midlands", :county => "Northamptonshire", :population => 88782},
  {:ons_code => "E07000156", :name => "Wellingborough", :region => "East Midlands", :county => "Northamptonshire", :population => 75733},
  {:ons_code => "E07000163", :name => "Craven", :region => "Yorkshire and The Humber", :county => "North Yorkshire", :population => 55414},
  {:ons_code => "E07000164", :name => "Hambleton", :region => "Yorkshire and The Humber", :county => "North Yorkshire", :population => 87576},
  {:ons_code => "E07000165", :name => "Harrogate", :region => "Yorkshire and The Humber", :county => "North Yorkshire", :population => 158686},
  {:ons_code => "E07000166", :name => "Richmondshire", :region => "Yorkshire and The Humber", :county => "North Yorkshire", :population => 52957},
  {:ons_code => "E07000167", :name => "Ryedale", :region => "Yorkshire and The Humber", :county => "North Yorkshire", :population => 53558},
  {:ons_code => "E07000168", :name => "Scarborough", :region => "Yorkshire and The Humber", :county => "North Yorkshire", :population => 108590},
  {:ons_code => "E07000169", :name => "Selby", :region => "Yorkshire and The Humber", :county => "North Yorkshire", :population => 82927},
  {:ons_code => "E07000170", :name => "Ashfield", :region => "East Midlands", :county => "Nottinghamshire", :population => 117008},
  {:ons_code => "E07000171", :name => "Bassetlaw", :region => "East Midlands", :county => "Nottinghamshire", :population => 111820},
  {:ons_code => "E07000172", :name => "Broxtowe", :region => "East Midlands", :county => "Nottinghamshire", :population => 111818},
  {:ons_code => "E07000173", :name => "Gedling", :region => "East Midlands", :county => "Nottinghamshire", :population => 113158},
  {:ons_code => "E07000174", :name => "Mansfield", :region => "East Midlands", :county => "Nottinghamshire", :population => 99635},
  {:ons_code => "E07000175", :name => "Newark and Sherwood", :region => "East Midlands", :county => "Nottinghamshire", :population => 113620},
  {:ons_code => "E07000176", :name => "Rushcliffe", :region => "East Midlands", :county => "Nottinghamshire", :population => 112831},
  {:ons_code => "E07000177", :name => "Cherwell", :region => "South East", :county => "Oxfordshire", :population => 140427},
  {:ons_code => "E07000178", :name => "Oxford", :region => "South East", :county => "Oxfordshire", :population => 153662},
  {:ons_code => "E07000179", :name => "South Oxfordshire", :region => "South East", :county => "Oxfordshire", :population => 130987},
  {:ons_code => "E07000180", :name => "Vale of White Horse", :region => "South East", :county => "Oxfordshire", :population => 119814},
  {:ons_code => "E07000181", :name => "West Oxfordshire", :region => "South East", :county => "Oxfordshire", :population => 103832},
  {:ons_code => "E07000187", :name => "Mendip", :region => "South West", :county => "Somerset", :population => 109018},
  {:ons_code => "E07000188", :name => "Sedgemoor", :region => "South West", :county => "Somerset", :population => 112798},
  {:ons_code => "E07000189", :name => "South Somerset", :region => "South West", :county => "Somerset", :population => 158627},
  {:ons_code => "E07000190", :name => "Taunton Deane", :region => "South West", :county => "Somerset", :population => 109379},
  {:ons_code => "E07000191", :name => "West Somerset", :region => "South West", :county => "Somerset", :population => 35364},
  {:ons_code => "E07000192", :name => "Cannock Chase", :region => "West Midlands", :county => "Staffordshire", :population => 94674},
  {:ons_code => "E07000193", :name => "East Staffordshire", :region => "West Midlands", :county => "Staffordshire", :population => 109447},
  {:ons_code => "E07000194", :name => "Lichfield", :region => "West Midlands", :county => "Staffordshire", :population => 98686},
  {:ons_code => "E07000195", :name => "Newcastle-under-Lyme", :region => "West Midlands", :county => "Staffordshire", :population => 124493},
  {:ons_code => "E07000196", :name => "South Staffordshire", :region => "West Midlands", :county => "Staffordshire", :population => 106592},
  {:ons_code => "E07000197", :name => "Stafford", :region => "West Midlands", :county => "Staffordshire", :population => 125968},
  {:ons_code => "E07000198", :name => "Staffordshire Moorlands", :region => "West Midlands", :county => "Staffordshire", :population => 95427},
  {:ons_code => "E07000199", :name => "Tamworth", :region => "West Midlands", :county => "Staffordshire", :population => 76003},
  {:ons_code => "E07000200", :name => "Babergh", :region => "East", :county => "Suffolk", :population => 85561},
  {:ons_code => "E07000201", :name => "Forest Heath", :region => "East", :county => "Suffolk", :population => 64345},
  {:ons_code => "E07000202", :name => "Ipswich", :region => "East", :county => "Suffolk", :population => 128269},
  {:ons_code => "E07000203", :name => "Mid Suffolk", :region => "East", :county => "Suffolk", :population => 94987},
  {:ons_code => "E07000204", :name => "St Edmundsbury", :region => "East", :county => "Suffolk", :population => 104533},
  {:ons_code => "E07000205", :name => "Suffolk Coastal", :region => "East", :county => "Suffolk", :population => 124281},
  {:ons_code => "E07000206", :name => "Waveney", :region => "East", :county => "Suffolk", :population => 117535},
  {:ons_code => "E07000207", :name => "Elmbridge", :region => "South East", :county => "Surrey", :population => 131930},
  {:ons_code => "E07000208", :name => "Epsom and Ewell", :region => "South East", :county => "Surrey", :population => 74272},
  {:ons_code => "E07000209", :name => "Guildford", :region => "South East", :county => "Surrey", :population => 137062},
  {:ons_code => "E07000210", :name => "Mole Valley", :region => "South East", :county => "Surrey", :population => 84630},
  {:ons_code => "E07000211", :name => "Reigate and Banstead", :region => "South East", :county => "Surrey", :population => 138639},
  {:ons_code => "E07000212", :name => "Runnymede", :region => "South East", :county => "Surrey", :population => 85920},
  {:ons_code => "E07000213", :name => "Spelthorne", :region => "South East", :county => "Surrey", :population => 93466},
  {:ons_code => "E07000214", :name => "Surrey Heath", :region => "South East", :county => "Surrey", :population => 84510},
  {:ons_code => "E07000215", :name => "Tandridge", :region => "South East", :county => "Surrey", :population => 83142},
  {:ons_code => "E07000216", :name => "Waverley", :region => "South East", :county => "Surrey", :population => 120252},
  {:ons_code => "E07000217", :name => "Woking", :region => "South East", :county => "Surrey", :population => 93499},
  {:ons_code => "E07000218", :name => "North Warwickshire", :region => "West Midlands", :county => "Warwickshire", :population => 61872},
  {:ons_code => "E07000219", :name => "Nuneaton and Bedworth", :region => "West Midlands", :county => "Warwickshire", :population => 122181},
  {:ons_code => "E07000220", :name => "Rugby", :region => "West Midlands", :county => "Warwickshire", :population => 94188},
  {:ons_code => "E07000221", :name => "Stratford-on-Avon", :region => "West Midlands", :county => "Warwickshire", :population => 118985},
  {:ons_code => "E07000222", :name => "Warwick", :region => "West Midlands", :county => "Warwickshire", :population => 138756},
  {:ons_code => "E07000223", :name => "Adur", :region => "South East", :county => "West Sussex", :population => 61630},
  {:ons_code => "E07000224", :name => "Arun", :region => "South East", :county => "West Sussex", :population => 150561},
  {:ons_code => "E07000225", :name => "Chichester", :region => "South East", :county => "West Sussex", :population => 113503},
  {:ons_code => "E07000226", :name => "Crawley", :region => "South East", :county => "West Sussex", :population => 107562},
  {:ons_code => "E07000227", :name => "Horsham", :region => "South East", :county => "West Sussex", :population => 130810},
  {:ons_code => "E07000228", :name => "Mid Sussex", :region => "South East", :county => "West Sussex", :population => 132456},
  {:ons_code => "E07000229", :name => "Worthing", :region => "South East", :county => "West Sussex", :population => 103179},
  {:ons_code => "E07000234", :name => "Bromsgrove", :region => "West Midlands", :county => "Worcestershire", :population => 93441},
  {:ons_code => "E07000235", :name => "Malvern Hills", :region => "West Midlands", :county => "Worcestershire", :population => 75381},
  {:ons_code => "E07000236", :name => "Redditch", :region => "West Midlands", :county => "Worcestershire", :population => 78666},
  {:ons_code => "E07000237", :name => "Worcester", :region => "West Midlands", :county => "Worcestershire", :population => 94763},
  {:ons_code => "E07000238", :name => "Wychavon", :region => "West Midlands", :county => "Worcestershire", :population => 117028},
  {:ons_code => "E07000239", :name => "Wyre Forest", :region => "West Midlands", :county => "Worcestershire", :population => 98147}
  ].each do |a|


    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :area_type => nmd, :population => a[:population], :parents => [
      england,
      Area.find_by_name!(a[:region]),
      Area.find_by_name!(a[:county])
    ])

  end


  md = AreaType.create(:name => "Metropolitan District")

  [{:ons_code => "E08000001", :name => "Bolton", :region => "North West", :population => 266492},
  {:ons_code => "E08000002", :name => "Bury", :region => "North West", :population => 183753},
  {:ons_code => "E08000003", :name => "Manchester", :region => "North West", :population => 498779},
  {:ons_code => "E08000004", :name => "Oldham", :region => "North West", :population => 219771},
  {:ons_code => "E08000005", :name => "Rochdale", :region => "North West", :population => 205190},
  {:ons_code => "E08000006", :name => "Salford", :region => "North West", :population => 228992},
  {:ons_code => "E08000007", :name => "Stockport", :region => "North West", :population => 284645},
  {:ons_code => "E08000008", :name => "Tameside", :region => "North West", :population => 216882},
  {:ons_code => "E08000009", :name => "Trafford", :region => "North West", :population => 217307},
  {:ons_code => "E08000010", :name => "Wigan", :region => "North West", :population => 307577},
  {:ons_code => "E08000011", :name => "Knowsley", :region => "North West", :population => 149116},
  {:ons_code => "E08000012", :name => "Liverpool", :region => "North West", :population => 445229},
  {:ons_code => "E08000013", :name => "St. Helens", :region => "North West", :population => 177363},
  {:ons_code => "E08000014", :name => "Sefton", :region => "North West", :population => 272876},
  {:ons_code => "E08000015", :name => "Wirral", :region => "North West", :population => 308837},
  {:ons_code => "E08000016", :name => "Barnsley", :region => "Yorkshire and The Humber", :population => 227610},
  {:ons_code => "E08000017", :name => "Doncaster", :region => "Yorkshire and The Humber", :population => 290593},
  {:ons_code => "E08000018", :name => "Rotherham", :region => "Yorkshire and The Humber", :population => 254605},
  {:ons_code => "E08000019", :name => "Sheffield", :region => "Yorkshire and The Humber", :population => 555507},
  {:ons_code => "E08000020", :name => "Gateshead", :region => "North East", :population => 191690},
  {:ons_code => "E08000021", :name => "Newcastle upon Tyne", :region => "North East", :population => 292179},
  {:ons_code => "E08000022", :name => "North Tyneside", :region => "North East", :population => 198478},
  {:ons_code => "E08000023", :name => "South Tyneside", :region => "North East", :population => 153670},
  {:ons_code => "E08000024", :name => "Sunderland", :region => "North East", :population => 283509},
  {:ons_code => "E08000025", :name => "Birmingham", :region => "West Midlands", :population => 1036878},
  {:ons_code => "E08000026", :name => "Coventry", :region => "West Midlands", :population => 315739},
  {:ons_code => "E08000027", :name => "Dudley", :region => "West Midlands", :population => 307362},
  {:ons_code => "E08000028", :name => "Sandwell", :region => "West Midlands", :population => 292799},
  {:ons_code => "E08000029", :name => "Solihull", :region => "West Midlands", :population => 206091},
  {:ons_code => "E08000030", :name => "Walsall", :region => "West Midlands", :population => 256898},
  {:ons_code => "E08000031", :name => "Wolverhampton", :region => "West Midlands", :population => 239354},
  {:ons_code => "E08000032", :name => "Bradford", :region => "Yorkshire and The Humber", :population => 512618},
  {:ons_code => "E08000033", :name => "Calderdale", :region => "Yorkshire and The Humber", :population => 202741},
  {:ons_code => "E08000034", :name => "Kirklees", :region => "Yorkshire and The Humber", :population => 409842},
  {:ons_code => "E08000035", :name => "Leeds", :region => "Yorkshire and The Humber", :population => 798769},
  {:ons_code => "E08000036", :name => "Wakefield", :region => "Yorkshire and The Humber", :population => 325573}].each do |a|

    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :area_type => md, :population => a[:population], :parents => [england, Area.find_by_name!(a[:region])])

  end


  lb = AreaType.create(:name => "London Borough")

  [{:ons_code => "E09000001", :name => "City of London", :population => 11677},
  {:ons_code => "E09000002", :name => "Barking and Dagenham", :population => 179741},
  {:ons_code => "E09000003", :name => "Barnet", :population => 348198},
  {:ons_code => "E09000004", :name => "Bexley", :population => 227957},
  {:ons_code => "E09000005", :name => "Brent", :population => 256556},
  {:ons_code => "E09000006", :name => "Bromley", :population => 312380},
  {:ons_code => "E09000007", :name => "Camden", :population => 235362},
  {:ons_code => "E09000008", :name => "Croydon", :population => 345562},
  {:ons_code => "E09000009", :name => "Ealing", :population => 318516},
  {:ons_code => "E09000010", :name => "Enfield", :population => 294927},
  {:ons_code => "E09000011", :name => "Greenwich", :population => 228509},
  {:ons_code => "E09000012", :name => "Hackney", :population => 219228},
  {:ons_code => "E09000013", :name => "Hammersmith and Fulham", :population => 169705},
  {:ons_code => "E09000014", :name => "Haringey", :population => 224996},
  {:ons_code => "E09000015", :name => "Harrow", :population => 230057},
  {:ons_code => "E09000016", :name => "Havering", :population => 236137},
  {:ons_code => "E09000017", :name => "Hillingdon", :population => 266114},
  {:ons_code => "E09000018", :name => "Hounslow", :population => 236760},
  {:ons_code => "E09000019", :name => "Islington", :population => 194080},
  {:ons_code => "E09000020", :name => "Kensington and Chelsea", :population => 169494},
  {:ons_code => "E09000021", :name => "Kingston upon Thames", :population => 168955},
  {:ons_code => "E09000022", :name => "Lambeth", :population => 284484},
  {:ons_code => "E09000023", :name => "Lewisham", :population => 266480},
  {:ons_code => "E09000024", :name => "Merton", :population => 208794},
  {:ons_code => "E09000025", :name => "Newham", :population => 240124},
  {:ons_code => "E09000026", :name => "Redbridge", :population => 270501},
  {:ons_code => "E09000027", :name => "Richmond upon Thames", :population => 190920},
  {:ons_code => "E09000028", :name => "Southwark", :population => 287041},
  {:ons_code => "E09000029", :name => "Sutton", :population => 194195},
  {:ons_code => "E09000030", :name => "Tower Hamlets", :population => 237896},
  {:ons_code => "E09000031", :name => "Waltham Forest", :population => 227145},
  {:ons_code => "E09000032", :name => "Wandsworth", :population => 289574},
  {:ons_code => "E09000033", :name => "Westminster", :population => 253112}
  ].each do |a|

    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :area_type => lb, :population => a[:population], :parents => [england, london])

  end

  sca = AreaType.create(:name => "Scottish Council Area")

  [{:ons_code => "S12000005", :name => "Clackmannanshire", :population => 50630},
  {:ons_code => "S12000006", :name => "Dumfries & Galloway", :population => 148190},
  {:ons_code => "S12000008", :name => "East Ayrshire", :population => 120240},
  {:ons_code => "S12000009", :name => "East Dunbartonshire", :population => 104580},
  {:ons_code => "S12000010", :name => "East Lothian", :population => 97500},
  {:ons_code => "S12000011", :name => "East Renfrewshire", :population => 89540},
  {:ons_code => "S12000013", :name => "Eilean Siar", :population => 26190},
  {:ons_code => "S12000014", :name => "Falkirk", :population => 153280},
  {:ons_code => "S12000015", :name => "Fife", :population => 365020},
  {:ons_code => "S12000017", :name => "Highland", :population => 221630},
  {:ons_code => "S12000018", :name => "Inverclyde", :population => 79770},
  {:ons_code => "S12000019", :name => "Midlothian", :population => 81140},
  {:ons_code => "S12000020", :name => "Moray", :population => 87720},
  {:ons_code => "S12000021", :name => "North Ayrshire", :population => 135180},
  {:ons_code => "S12000023", :name => "Orkney Islands", :population => 20110},
  {:ons_code => "S12000024", :name => "Perth & Kinross", :population => 147780},
  {:ons_code => "S12000026", :name => "Scottish Borders", :population => 112870},
  {:ons_code => "S12000027", :name => "Shetland Islands", :population => 22400},
  {:ons_code => "S12000028", :name => "South Ayrshire", :population => 111440},
  {:ons_code => "S12000029", :name => "South Lanarkshire", :population => 311880},
  {:ons_code => "S12000030", :name => "Stirling", :population => 89850},
  {:ons_code => "S12000033", :name => "Aberdeen City", :population => 217120},
  {:ons_code => "S12000034", :name => "Aberdeenshire", :population => 245780},
  {:ons_code => "S12000035", :name => "Argyll & Bute", :population => 89200},
  {:ons_code => "S12000036", :name => "Edinburgh, City of", :population => 486120},
  {:ons_code => "S12000038", :name => "Renfrewshire", :population => 170250},
  {:ons_code => "S12000039", :name => "West Dunbartonshire", :population => 90570},
  {:ons_code => "S12000040", :name => "West Lothian", :population => 172080},
  {:ons_code => "S12000041", :name => "Angus", :population => 110570},
  {:ons_code => "S12000042", :name => "Dundee City", :population => 144290},
  {:ons_code => "S12000043", :name => "Glasgow City", :population => 592820},
  {:ons_code => "S12000044", :name => "North Lanarkshire", :population => 326360}
  ].each do |a|

    area = Area.create(:ons_code => a[:ons_code], :name => a[:name], :population => a[:population], :area_type => sca, :parents => [scotland])

  end



  postcode = AreaType.create(:name => "Postcode")
  postcode_sector = AreaType.create(:name => "Postcode Sector")
  postcode_area = AreaType.create(:name => "Postcode Area")
  postcode_district = AreaType.create(:name => "Postcode District")

  bbc_region = AreaType.create(:name => "BBC Region")

  [
    {:ref => "503", :name => "East of England"},
    {:ref => "504", :name => "West"},
    {:ref => "505", :name => "South West"},
    {:ref => "506", :name => "South"},
    {:ref => "507", :name => "Yorkshire and Lincolnshire"},
    {:ref => "508", :name => "North East and Cumbria"},
    {:ref => "509", :name => "North West"},
    {:ref => "510", :name => "Scotland"},
    {:ref => "511", :name => "Ulster"},
    {:ref => "512", :name => "Wales"},
    {:ref => "513", :name => "West Midlands"},
    {:ref => "514", :name => "East Midlands"},
    {:ref => "515", :name => "London"},
    {:ref => "516", :name => "South East"}
  ].each do |a|

    Area.create(:ref => a[:ref], :name => a[:name], :area_type => bbc_region)
  end

