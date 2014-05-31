class LocationsController < ApplicationController
  load_and_authorize_resource except: [:index, :create]
  before_action :load_address, only: [:show, :edit]

 def index
    @locations = Location.paginate :page => params[:page], :per_page => 10
  end

  def new
    @location.build_address
  end

  def create
    @location = Location.new location_params

    path = if params[:commit] == 'Save & Add New'
             new_location_path
           elsif params[:commit] == 'Add Location'
             locations_path
           end

    @location.save
    respond_with @location, location: path
  end

  def show
  end

  def edit
  end
  
  def update
    @location.update_attributes location_params
    respond_with @location, location: @location
  end

  def destroy
    @location.destroy
    respond_with @location, location: locations_path
  end


  private
  
  def location_params
    params.require(:location).permit(:name, :phone, :comments, address_attributes: [:address1, :address2, :zip])
  end

  def load_address
    @address = @location.address
  end
end
