module API::V1
  class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    def login
      @user = User.find_by_username(params[:username])
      if @user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 1.day.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                      username: @user.username, user_id: @user.id }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    private

    def login_params
      params.permit(:email, :password)
    end
  end
end
