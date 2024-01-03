class Api::V1::WarehouseLocationsController < ApiController


  def show
      @warehouse_location = WarehouseLocation.find(params[:id])
  end

  def index
    @warehouse_locations = WarehouseLocation.filter(warehouse_location_filter)
  end

  def create
    @warehouse_location = WarehouseLocation.new(warehouse_location_params)

    if @warehouse_location.save
      render json: @warehouse_location, status: :created
    else
      render json: @warehouse_location.errors, status: :unprocessable_entity
    end
  end

  def destroy

    WarehouseLocation.find(params[:id]).destroy!

    head :no_content
  end

  private

  def warehouse_location_params
    params.require(:warehouse_location).permit(:warehouse_division_id, :location_type_id, :location,
                    :storage_location_id, :stock_type_id, :location_property_id, :special_stock_type,
                    :special_text, :drop_zone, :loc_status, :latitude, :longitude, :last_updated_by)
  end

  def warehouse_location_filter
    params.slice(:warehouse_division_id, :location_type_id, :location)
  end

end