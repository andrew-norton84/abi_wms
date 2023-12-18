class ContainersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @containers = Container.where("warehouse_division_id = ? AND location_type_id = ?",
                            current_user.warehouse_division_id, current_user.location_type_id)
                            .paginate(page: params[:page])
  end

  def show
    @container = Container.find(params[:id])
    @container.product_string = @container.product.product
    @container.location_string = @container.warehouse_location.location
  end

  def new
    @container = Container.new
    if (current_user.warehouse_division_id != nil)
      @container.warehouse_division_id = current_user.warehouse_division_id
    end
    if (current_user.location_type_id != nil)
      @container.location_type_id = current_user.location_type_id
    end
  end

  def create

    attributes = container_params.clone

    if @product = Product.find_by(product: container_params[:product_string])
      attributes[:product_id] = @product.id
    else
      attributes[:product_id] = 0
    end

    if @warehouse_location = WarehouseLocation.find_by(location: container_params[:location_string],
                                                       warehouse_division_id: current_user.warehouse_division_id,
                                                       location_type_id: current_user.location_type_id)
      attributes[:warehouse_location_id] = @warehouse_location.id
    else
      attributes[:warehouse_location_id] = 0
    end

    @container = Container.new(attributes)

    if (current_user.warehouse_division_id != nil)
      @container.warehouse_division_id = current_user.warehouse_division_id
    end
    if (current_user.location_type_id != nil)
      @container.location_type_id = current_user.location_type_id
    end

    if @container.save
      flash[:success] = "Container created"
      redirect_to containers_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @container = Container.find(params[:id])
    @container.product_string = @container.product.product
    @container.location_string = @container.warehouse_location.location
  end

  def update

    @container = Container.find(params[:id])

    attributes = container_params

    if @warehouse_location = WarehouseLocation.find_by(location: container_params[:location_string],
                                                       warehouse_division_id: @container.warehouse_division_id,
                                                       location_type_id: @container.location_type_id)
      attributes[:warehouse_location_id] = @warehouse_location.id
    else
      attributes[:warehouse_location_id] = 0
    end

    if @product = Product.find_by(product: container_params[:product_string])
      attributes[:product_id] = @product.id
    else
      attributes[:product_id] = 0
    end

    if @container.update(attributes)
      flash[:success] = "Container updated"
      redirect_to containers_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end

  end

  def destroy
    @container = Container.find(params[:id]).destroy
    flash[:success] = "Container deleted"
    redirect_to containers_path, status: :see_other
  end


  private

  def container_params
    params.require(:container).permit(:container_id, :warehouse_division_id, :location_type_id,
                    :warehouse_location_id, :storage_location_id, :stock_type_id, :product_id, :quantity,
                    :expiry_date, :manufact_date, :batch_number, :reference, :notes, :special_stock_type,
                    :special_text, :sub_location, :secondary_status, :serial_number, :last_updated_by,
                    :product_string, :location_string)
  end

end
