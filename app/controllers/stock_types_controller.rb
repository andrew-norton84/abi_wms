class StockTypesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @stock_types = StockType.paginate(page: params[:page])
  end

  def show
    @stock_type = StockType.find(params[:id])
  end

  def new
    @stock_type = StockType.new
  end

  def create
    @stock_type = StockType.new(stock_type_params)

    if @stock_type.save
      flash[:success] = @stock_type.short_desc + " created"
      redirect_to stock_types_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @stock_type = StockType.find(params[:id])
  end

  def update
    @stock_type = StockType.find(params[:id])
    if @stock_type.update(stock_type_params)
      flash[:success] = @stock_type.short_desc + " updated"
      redirect_to stock_types_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @stock_type = StockType.find(params[:id]).destroy
    flash[:success] = @stock_type.short_desc + " deleted"
    redirect_to stock_types_path, status: :see_other
  end

  private

  def stock_type_params
    params.require(:stock_type).permit(:stock_type, :short_desc, :description )
  end
end
