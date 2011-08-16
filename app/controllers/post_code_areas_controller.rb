class PostCodeAreasController < ApplicationController

  def show
    begin
      @area = Area.find_by_name!(params[:area_id])
    rescue
      @area = Area.find(params[:area_id])
    end
  end

end
