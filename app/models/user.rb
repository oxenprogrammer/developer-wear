class User < ApplicationRecord
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_secure_password
  has_many :favourites
  has_many :shirts, through: :favourites, dependent: :destroy

  validates :username, presence: true, length: { minimum: 3, maximum: 30 }
  validates :password, length: { minimum: 6 }, presence: true
  validates :email, presence: true, length: { minimum: 6, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
