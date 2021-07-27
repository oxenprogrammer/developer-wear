class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  include Authenticable

  def not_destroyed(errors)
    render json: { errors: errors.record.errors }, status: :unprocessable_entity
  end
end
