class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    # @user = User.find(params[:id]) - Below is preferred as it will
    # render your actual error code
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json: {error: "User not found."}, status: 404
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {error: "Unable to create user."}, status: 400
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy()
      render json: {"User successfully deleted."}
    else
      render json: {error: "User not found."}, status: 400
    end
  end

  def signin
    @user = User.find_by(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
