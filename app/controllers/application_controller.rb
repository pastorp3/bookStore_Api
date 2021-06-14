class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_id

  def invalid_id(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

end
