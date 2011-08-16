class AreasController < ApplicationController


  def show
    areas = Area.where(:name => params[:id])

    if areas.size == 0

      other_names = OtherName.where(:name => params[:id])
      if other_names.size == 1
        redirect_to area_path(other_names.first.area.name)
      elsif other_names.size > 1
        @areas = other_names.collect {|on| on.area}
      else
        area_with_code = Area.find_by_ons_code(params[:id])
        if area_with_code
          redirect_to area_path(area_with_code.name)
        else
          Area.find(params[:id])
        end
      end

    elsif areas.size == 1
      @area = areas.first
    elsif areas.size > 1
      @areas = areas
      render :disambig
    end

  end

  def index
  end

end
