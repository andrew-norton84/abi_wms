class SuppliersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @suppliers = Supplier.paginate(page: params[:page])
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      flash[:success] = @supplier.supplier + " created"
      redirect_to suppliers_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      flash[:success] = @supplier.supplier + " updated"
      redirect_to suppliers_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id]).destroy
    flash[:success] = @supplier.supplier + " deleted"
    redirect_to suppliers_path, status: :see_other
  end

  private

  def supplier_params
    params.require(:supplier).permit(:supplier, :name, :country_id)
  end
end
