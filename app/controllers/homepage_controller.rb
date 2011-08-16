class HomepageController < ApplicationController

  before_filter :redirect_if_searching

  def show
    @area = Area.new
  end

  private

  def redirect_if_searching
    if params[:name]
      redirect_to area_path(params[:name])
    end
  end

end
