class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  validates :email, presence: true, uniqueness: { case_sensitive: true }
end
