class HousesController < ApplicationController
  # filters
  before_action :set_house, only: %i[show update destroy]

  def index
    render json: House.all
  end

  def show
    if @house.nil?
      render json: {}, status: :not_found
    else
      render json: @house
    end
  end

  def create
    house = House.new(house_params)
    if house.save
      render json: house, status: :created
    else
      render json: house, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def update
    if @house.update_attributes(house_params)
      render json: @house, status: :created
    else
      render json: @house, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def destroy
    render json: @house.destroy, status: :no_content
  end

  protected

  # Allowed parameters
  def house_params
    params.permit(:name, :password)
  end

  # Sets model based on param +id+
  def set_house
    @house ||= House.find_by(id: params[:id])
  end
end
