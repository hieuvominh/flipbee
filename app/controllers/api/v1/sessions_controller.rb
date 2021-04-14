# frozen_string_literal: true

class SessionsController < ApplicationController
  # def new
  # end

  # def create
  #   user = User.where(username: params_user[:username])
  #   if user && user.authenticate(params_user[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_url, notice: "Logged in!"
  #   else
  #     flash.now[:alert] = "Email or password is invalid"
  #     render "new"
  #   end
  # end

  # def destroy
  # end

  # private

  # def params_user
  #   params.permit(
  #     :username, :password
  #   )
  # end
end
