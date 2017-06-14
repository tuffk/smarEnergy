class UsersController < ApplicationController
  # filters
  before_action :set_user, only: %i[show update destroy]

  def index
    render json: User.all
  end

  def show
    if @user.nil?
      render json: {}, status: :not_found
    else
      render json: @user
    end
  end

  def login
    binding.pry
    user = User.find_by(name: user_params[:name], password: user_params[:password])
    if user.nil?
      render json: {}, status: :unauthorized
    else
      render json: {}, status: :ok
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def update
    if @user.update_attributes(user_params)
      render json: @user, status: :created
    else
      render json: @user, status: :unprocessable_entity, serializer: ErrorSerializer
    end
  end

  def destroy
    render json: @user.destroy, status: :no_content
  end

  protected

  # Allowed parameters
  def user_params
    params.permit(:name, :password)
  end

  # Sets model based on param +id+
  def set_user
    @user ||= User.find_by(id: params[:id])
  end
end
