class DevicesController < ApplicationController
  # filters
  before_action :set_device, only: %i[show update destroy]

  def index
    render json: Device.all
  end

  def show
    if @device.nil?
      render json: {}, status: :not_found
    else
      render json: @device
    end
  end

  def create
    device = Device.new(device_params)
    if device.save
      render json: device, status: :created
    else
      render json: device, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def update
    if @device.update_attributes(device_params)
      render json: @device, status: :created
    else
      render json: @device, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def destroy
    render json: @device.destroy, status: :no_content
  end

  protected

  # Allowed parameters
  def device_params
    params.permit(:house_id, :area, :brand, :job, :resource_type)
  end

  # Sets model based on param +id+
  def set_device
    @device ||= Device.find_by(id: params[:id])
  end
end
