class WarehouseLocationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @warehouse_locations = WarehouseLocation.paginate(page: params[:page])
  end

  def show
    @warehouse_location = WarehouseLocation.find(params[:id])
  end

  def new
    @warehouse_location = WarehouseLocation.new
  end

  def create
    @warehouse_location = WarehouseLocation.new(warehouse_location_params)

    if @warehouse_location.save
      flash[:success] = @warehouse_location.location + " created"
      redirect_to warehouse_locations_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @warehouse_location = WarehouseLocation.find(params[:id])
  end

  def update
    @warehouse_location = WarehouseLocation.find(params[:id])
    if @warehouse_location.update(warehouse_location_params)
      flash[:success] = @warehouse_location.location + " updated"
      redirect_to warehouse_locations_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse_location = WarehouseLocation.find(params[:id]).destroy
    flash[:success] = @warehouse_location.location + " deleted"
    redirect_to warehouse_locations_path, status: :see_other
  end

  private

  def warehouse_location_params
    params.require(:warehouse_location).permit(:warehouse_division_id, :location_type_id, :location,
                    :storage_location_id, :stock_type_id, :location_property_id, :special_stock_type,
                    :special_text, :drop_zone, :loc_status, :latitude, :longitude, :last_updated_by)
  end
end
