class FavouritesRepresenter
  def initialize(favourites)
    @favourites = favourites
  end

  def as_json
    favourites.map do |favourite|
      {
        id: favourite.id,
        user_id: favourite.user.id,
        shirt_id: favourite.shirt.id,
        shirt_name: favourite.shirt.name,
        shirt_description: favourite.shirt.description,
        shirt_price: favourite.shirt.price,
        shirt_image: favourite.shirt.image
      }
    end
  end

  private

  attr_reader :favourites
end
