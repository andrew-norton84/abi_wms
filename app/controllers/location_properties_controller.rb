class LocationPropertiesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @location_properties = LocationProperty.paginate(page: params[:page])
  end

  def show
    @location_property = LocationProperty.find(params[:id])
  end

  def new
    @location_property = LocationProperty.new
  end

  def create
    @location_property = LocationProperty.new(location_property_params)

    if @location_property.save
      flash[:success] = @location_property.property_group + " created"
      redirect_to location_properties_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location_property = LocationProperty.find(params[:id])
  end

  def update
    @location_property = LocationProperty.find(params[:id])
    if @location_property.update(location_property_params)
      flash[:success] = @location_property.property_group + " updated"
      redirect_to location_properties_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @location_property = LocationProperty.find(params[:id]).destroy
    flash[:success] = @location_property.property_group + " deleted"
    redirect_to location_properties_path, status: :see_other
  end

  private

  def location_property_params
    params.require(:location_property).permit(:property_group, :description, :storage_location_id,
                    :stock_type_id, :product_type_id, :loc_height, :loc_width, :loc_depth,
                    :no_of_skus, :no_of_batches, :replen_zone, :count_zone, :exist_empty,
                    :create_on_fly)
  end
end
