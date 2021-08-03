class Api::V1::UsersController < ApplicationController
  before_action :check_owner, only: %i[update]
  before_action :check_admin, only: %i[update destroy index]

  def index
    count = User.all.count
    users = User.limit(limit).offset(params[:offset])
    render json: { status: :ok, count: count, data: users.as_json(only: %i[id username email]) }, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      token = AuthenticationTokenService.encode(user.id)
      render json: { token: token, email: user.email, username: user.username, admin: user.admin }.as_json, status: :created
    else
      render json: user.errors.as_json(only: %i[id username email]), status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id]).destroy!
    head :no_content if user.destroy
  end

  def update
    if user
      user.update(user_params)
      if user.save
        render json: user.as_json(only: %i[id username email]), status: :ok
      else
        render json: user.errors.as_json, status: :unprocessable_entity
      end
    else
      render json: { status: :not_found, message: 'user not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password_confirmation, :password)
  end

  def user
    @user ||= User.find_by(id: params.require(:id))
  end

  def check_owner
    head :forbidden unless user.id == current_user&.id
  end
end
