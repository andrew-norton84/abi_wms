class Api::V1::ContainersController < ApiController

  def show
      @container = Container.find(params[:id])
  end

  def index
    if params[:warehouse_location_id]
      @warehouse_location = WarehouseLocation.find(params[:warehouse_location_id])
      if !@warehouse_location.nil?
        @containers = @warehouse_location.containers
      end
    else
      @containers = Container.filter(container_filter)
    end
  end

  def create
    @container = Container.new(container_params)

    if @container.save
      render json: @container, status: :created
    else
      render json: @container.errors, status: :unprocessable_entity
    end
  end

  def destroy

    Container.find(params[:id]).destroy!

    head :no_content
  end

  private

  def container_params
    params.require(:container).permit(:container_id, :warehouse_division_id, :location_type_id,
                    :warehouse_location_id, :storage_location_id, :stock_type_id, :product_id, :quantity,
                    :expiry_date, :manufact_date, :batch_number, :reference, :notes, :special_stock_type,
                    :special_text, :sub_location, :secondary_status, :serial_number, :last_updated_by,
                    :product_string, :location_string)
  end

  def container_filter
    params.slice(:warehouse_division_id, :location_type_id, :location)
  end

end