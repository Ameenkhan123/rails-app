class AuthenticationController < ApplicationController

  def authenticate
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      response = { success: true, message: "You are logged in successfully!" }
    else
      response = { success: false, message: "Invalid Login and Password!" }
    end
    json_response(response)
  end
  
end
