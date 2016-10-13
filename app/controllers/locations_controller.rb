class LocationsController < ApplicationController
  def show
    @location = Location.find(id:params[:id])
  end
end
