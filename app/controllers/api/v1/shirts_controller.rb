class Api::V1::ShirtsController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    shirts = Shirt.limit(limit).offset(params[:offset])
    render json: shirts.as_json
  end

  def create; end

  def destroy; end

  private

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end
end
