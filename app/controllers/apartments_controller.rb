class ApartmentsController < ApplicationController

  def index
    render json: Apartment.all, status: 404
  end

  def show
    apartment = Apartment.find_by_id(params[:id]), status: 200
    render json: apartment
  end

  def create
    render json: Apartment.create(apartment_params), status: 200
  end

  def update
    apartment = Apartment.find_by(id: params[:id])
    render json: apartment.update(apartment_params), status: :ok
  end

  def destroy
    Apartment.find_by(id: params[:id]).destroy
    head: :no_content
  end

  private

  def apartment_params
    params.permit(:number)
  end

end
