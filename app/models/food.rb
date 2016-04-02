class Food < ActiveRecord::Base
  has_many :ingredients, inverse_of: :food
  has_many :recipes, through: :ingredients
end
