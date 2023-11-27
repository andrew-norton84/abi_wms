class CustomersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @customers = Customer.paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      flash[:success] = @customer.customer + " created"
      redirect_to customers_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = @customer.customer + " updated"
      redirect_to customers_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id]).destroy
    flash[:success] = @customer.customer + " deleted"
    redirect_to customers_path, status: :see_other
  end

  private

  def customer_params
    params.require(:customer).permit(:customer, :name, :country_id)
  end
end
