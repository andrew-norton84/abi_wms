class StorageLocationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @storage_locations = StorageLocation.paginate(page: params[:page])
  end

  def show
    @storage_location = StorageLocation.find(params[:id])
  end

  def new
    @storage_location = StorageLocation.new
  end

  def create
    @storage_location = StorageLocation.new(storage_location_params)

    if @storage_location.save
      flash[:success] = @storage_location.short_desc + " created"
      redirect_to storage_locations_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @storage_location = StorageLocation.find(params[:id])
  end

  def update
    @storage_location = StorageLocation.find(params[:id])
    if @storage_location.update(storage_location_params)
      flash[:success] = @storage_location.short_desc + " updated"
      redirect_to storage_locations_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @storage_location = StorageLocation.find(params[:id]).destroy
    flash[:success] = @storage_location.short_desc + " deleted"
    redirect_to storage_locations_path, status: :see_other
  end

  private

  def storage_location_params
    params.require(:storage_location).permit(:storage_location, :short_desc, :description )
  end
end