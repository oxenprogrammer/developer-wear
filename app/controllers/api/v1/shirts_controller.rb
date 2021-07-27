class Api::V1::ShirtsController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    shirts = Shirt.limit(limit).offset(params[:offset])
    render json: shirts.as_json
  end

  def create
    shirt = Shirt.new(shirt_params)
    if shirt.save
      render json: shirt.as_json, status: :created
    else
      render json: shirt.errors, status: :unprocessable_entity
    end
  end

  def destroy
    shirt = Shirt.find(params[:id]).destroy!
    head :no_content if shirt.destroy
  end

  private

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end

  def shirt_params
    params.permit(:name, :description, :price, :image)
  end
end
