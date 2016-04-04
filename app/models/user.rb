class User < ActiveRecord::Base
  include Clearance::User

  has_many :recipes

  validates :username, :email, presence: true
  validates :password, confirmation: true
  validates :email, :username, uniqueness: true
end
