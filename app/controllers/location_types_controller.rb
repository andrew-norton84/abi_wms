class LocationTypesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @location_types = LocationType.paginate(page: params[:page])
  end

  def show
    @location_type = LocationType.find(params[:id])
  end

  def new
    @location_type = LocationType.new
  end

  def create
    @location_type = LocationType.new(location_type_params)

    if @location_type.save
      flash[:success] = @location_type.short_desc + " created"
      redirect_to location_types_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location_type = LocationType.find(params[:id])
  end

  def update
    @location_type = LocationType.find(params[:id])
    if @location_type.update(location_type_params)
      flash[:success] = @location_type.short_desc + " updated"
      redirect_to location_types_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @location_type = LocationType.find(params[:id]).destroy
    flash[:success] = @location_type.short_desc + " deleted"
    redirect_to location_types_path, status: :see_other
  end

  private

  def location_type_params
    params.require(:location_type).permit(:location_type, :short_desc, :description )
  end
end
