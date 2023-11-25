class CountriesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @countries = Country.paginate(page: params[:page])
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      flash[:success] = @country.name + " created"
      redirect_to countries_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      flash[:success] = @country.name + " updated"
      redirect_to countries_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @country = Country.find(params[:id]).destroy
    flash[:success] = @country.name + " deleted"
    redirect_to countries_path, status: :see_other
  end

  private

  def country_params
    params.require(:country).permit(:name, :full_name)
  end
end
