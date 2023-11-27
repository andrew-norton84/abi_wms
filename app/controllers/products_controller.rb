class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @products = Product.paginate(page: params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = @product.product + " created"
      redirect_to products_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = @product.product + " updated"
      redirect_to products_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    flash[:success] = @product.product + " deleted"
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:product, :description, :country_id, :product_type_id)
  end
end
