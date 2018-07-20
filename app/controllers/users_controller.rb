class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users.to_json
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user.to_json
  end

  def edit
    @user = User.find(params[:id])
    render json: @user.to_json
  end


  def create
    @user = User.new(user_params)
    if @user.save
      response = {success: true, message: "user was successfully create" }
      json_response(response, :created)
    else
      response = {success: false, message: "check the email and password" }
      json_response(response, :created)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      response = {success: true, message: "user was successfully update" }
      json_response(response, :updated)
    else
      response = {success: false, message: "check the email and password" }
      json_response(response, :updated)
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      response = { success: true, message: "user was successfully destroy" }
      json_response(response, :destroy)
    else
      response = { success: false, message: "user was not destroy" }
      render json: @user.errors
    end
  end

  private
  def user_params
    params.permit(
      :email,
      :password,
      :password_confirmation
      )
  end
end
