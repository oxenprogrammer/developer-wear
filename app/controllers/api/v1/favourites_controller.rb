class Api::V1::FavouritesController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    count = Favourite.all.count
    favourites = Favourite.limit(limit).offset(params[:offset])
    render json: { status: :ok, count: count, data: FavouritesRepresenter.new(favourites).as_json }, status: :ok
  end

  def create
    favourite = Favourite.new(user_id: current_user&.id, shirt_id: params[:id])
    if favourite.save
      render json: favourite.as_json, status: :created
    else
      render json: favourite.errors.as_json, status: :unprocessable_entity
    end
  end

  def show
    count = Favourite.user_favourites(current_user).all.count
    user_favourites = Favourite.user_favourites(current_user)
    paginated_favourites = user_favourites.limit(limit).offset(params[:offset])
    render json: { status: '200', count: count, data: FavouritesRepresenter.new(paginated_favourites).as_json },
           status: :ok
  end

  private

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end
end