class Recipe < ActiveRecord::Base
  has_many :ingredients, inverse_of: :recipe
  has_many :foods, through: :ingredients
end
