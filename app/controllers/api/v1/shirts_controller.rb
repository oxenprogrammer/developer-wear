class Api::V1::ShirtsController < ApplicationController
  before_action :check_admin, only: %i[create update destroy]
  before_action :current_user, only: %i[index show]

  def index
    count = Shirt.all.count
    shirts = Shirt.limit(limit).offset(params[:offset])
    render json: { status: :ok, count: count, data: shirts.as_json }, status: :ok
  end

  def create
    shirt = Shirt.new(shirt_params)
    if shirt.save
      render json: shirt.as_json, status: :created
    else
      render json: shirt.errors.as_json, status: :unprocessable_entity
    end
  end

  def destroy
    shirt = Shirt.find(params[:id]).destroy!
    head :no_content if shirt.destroy
  end

  def update
    if shirt
      shirt.update(shirt_params)
      if shirt.save
        render json: shirt.as_json, status: :ok
      else
        render json: shirt.errors.as_json, status: :unprocessable_entity
      end
    else
      render json: { status: :not_found, message: 'shirt not found' }, status: :not_found
    end
  end

  def show
    shirt = Shirt.find(params[:id])
    if shirt
      render json: shirt.as_json, status: :ok
    else
      render status: :not_found
    end
  end

  private

  def shirt_params
    params.permit(:name, :description, :price, :image)
  end

  def shirt
    @shirt ||= Shirt.find_by(id: params.require(:id))
  end
end
