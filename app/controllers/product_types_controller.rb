class ProductTypesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @product_types = ProductType.paginate(page: params[:page])
  end

  def show
    @product_type = ProductType.find(params[:id])
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)

    if @product_type.save
      flash[:success] = @product_type.short_desc + " created"
      redirect_to product_types_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product_type = ProductType.find(params[:id])
  end

  def update
    @product_type = ProductType.find(params[:id])
    if @product_type.update(product_type_params)
      flash[:success] = @product_type.short_desc + " updated"
      redirect_to product_types_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id]).destroy
    flash[:success] = @product_type.short_desc + " deleted"
    redirect_to product_types_path, status: :see_other
  end

  private

  def product_type_params
    params.require(:product_type).permit(:product_type, :short_desc, :description )
  end
end
