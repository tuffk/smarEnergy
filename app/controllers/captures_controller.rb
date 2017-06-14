# +Captures+ controller
class CapturesController < ApplicationController
  # filters
  before_action :set_capture, only: %i[show update destroy]

  def index
    render json: Capture.all
  end

  def show
    if @capture.nil?
      render json: {}, status: :not_found
    else
      render json: @capture
    end
  end

  def create
    capture = Capture.new(capture_params)
    if capture.save
      render json: capture, status: :created
    else
      render json: capture, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def update
    if @capture.update_attributes(capture_params)
      render json: @capture, status: :created
    else
      render json: @capture, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def destroy
    render json: @capture.destroy, status: :no_content
  end

  protected

  # Allowed parameters
  def capture_params
    params.permit(:device_id, :start, :stop, :amount)
  end

  # Sets model based on param +id+
  def set_capture
    @capture ||= Capture.find_by(id: params[:id])
  end
end
