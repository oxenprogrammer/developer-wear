class Api::V1::UsersController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    count = User.all.count
    users = User.limit(limit).offset(params[:offset])
    render json: { status: :ok, count: count, data: users.as_json(only: %i[id username email]) }, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user.as_json, status: :created
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

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end

  def user_params
    params.permit(:username, :email, :password_confirmation, :password)
  end

  def user
    @user ||= User.find_by(email: params.require(:email))
  end
end
