class Shirt < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :description, presence: true, length: { minimum: 10, maximum: 100 }
  validates :price, presence: true
  validates :image, presence: true
end
