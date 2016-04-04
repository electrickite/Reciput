class Recipe < ActiveRecord::Base
  has_many :ingredients, inverse_of: :recipe
  has_many :foods, through: :ingredients
  has_many :steps
  belongs_to :user

  validates :name, presence: true
end
