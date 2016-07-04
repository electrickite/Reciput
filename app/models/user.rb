class User < ActiveRecord::Base
  include Clearance::User

  has_many :recipes, foreign_key: 'owner_id', inverse_of: :owner
  has_and_belongs_to_many :shared_recipes, class_name: 'Recipe', inverse_of: :users

  validates :username, :email, presence: true
  validates :password, confirmation: true
  validates :email, :username, uniqueness: true

  def to_s
    username
  end
end
