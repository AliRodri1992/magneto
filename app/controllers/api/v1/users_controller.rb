class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    render json: User.all, code: '200', status: :ok
  end

  def show
    render json: UserSerializer.new(@user)
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, code: '201'
    else
      render json: user.errors, status: :unprocessable_entity, code: '422'
    end
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user), status: :ok, code: '200'
    else
      render json: :unprocessable_entity, code: '422'
    end
  end

  def destroy
    if @user.destroy
      render json: @user, status: :ok, code: '200'
    else
      render json: @user.errors, status: :unprocessable_entity, code: '422'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
