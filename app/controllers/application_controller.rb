class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    @header = request.headers['Authorization']
    @header = @header.split(' ').last if @header
    begin
      @decoded = JsonWebToken.decode(@header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end

  def cors_preflight_check
    headers['Access-Control-Max-Age'] = '1728000'

    render json: {} # Render as you need
  end
end
