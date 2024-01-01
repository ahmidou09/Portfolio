class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = jwt_encode({ user_id: @user.id })
      time = Time.now + 24.hours.to_i

      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'), username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def logout
    header = request.headers['Authorization']
    token = header.split.last if header.present?

    if token
      # Add the token to the set of invalidated tokens
      invalidate_token(token)
      render json: { message: 'Logout successful. Token invalidated.' }, status: :ok
    else
      render json: { error: 'Token not found' }, status: :bad_request
    end
  end

  private

  def invalidate_token(token)
    $invalid_tokens ||= Set.new
    $invalid_tokens << token
  end
end
