class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :shirt

  def self.user_favourites(current_user)
    where(user_id: current_user&.id).order(created_at: :desc)
  end
end
