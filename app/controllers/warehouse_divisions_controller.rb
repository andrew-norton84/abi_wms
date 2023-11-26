class WarehouseDivisionsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @warehouse_divisions = WarehouseDivision.paginate(page: params[:page])
  end

  def show
    @warehouse_division = WarehouseDivision.find(params[:id])
  end

  def new
    @warehouse_division = WarehouseDivision.new
  end

  def create
    @warehouse_division = WarehouseDivision.new(warehouse_division_params)

    if @warehouse_division.save
      flash[:success] = @warehouse_division.division + " created"
      redirect_to warehouse_divisions_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @warehouse_division = WarehouseDivision.find(params[:id])
  end

  def update
    @warehouse_division = WarehouseDivision.find(params[:id])
    if @warehouse_division.update(warehouse_division_params)
      flash[:success] = @warehouse_division.division + " updated"
      redirect_to warehouse_divisions_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse_division = WarehouseDivision.find(params[:id]).destroy
    flash[:success] = @warehouse_division.division + " deleted"
    redirect_to warehouse_divisions_path, status: :see_other
  end

  private

  def warehouse_division_params
    params.require(:warehouse_division).permit(:division, :description, :country_id)
  end
end
