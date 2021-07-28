class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  include Authenticable
  MAX_PAGINATION_LIMIT = 100

  def not_destroyed(errors)
    render json: { errors: errors.record.errors }, status: :unprocessable_entity
  end

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end

  def check_admin
    head :forbidden unless current_user.admin == true
  end
end
