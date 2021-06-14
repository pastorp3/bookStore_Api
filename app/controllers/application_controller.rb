class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_id
  before_action :authorized

  def invalid_id(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end


  def logged_in_user
    if auth_header
      @user = User.find_by(token: auth_header)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'invalid Token'}, status: :unauthorized unless logged_in?
  end

end
