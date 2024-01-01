class ApplicationController < ActionController::API
  include JwtToken
  before_action :authenticate_user

  private

  def authenticate_user
    header = request.headers['Authorization']

    if header
      token = header.split.last

      begin
        @decoded = jwt_decode(token)
        @current_user = User.find(@decoded[:user_id])
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
        Rails.logger.error("Authentication failed: #{e.message}")
        render json: { errors: e.message }, status: :unauthorized
      end
    else
      Rails.logger.error("Authorization header missing")
      render json: { errors: 'Authorization header missing' }, status: :unauthorized
    end
  end
end
