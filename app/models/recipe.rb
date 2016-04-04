class Recipe < ActiveRecord::Base
  has_many :ingredients, inverse_of: :recipe
  has_many :foods, through: :ingredients
  has_many :steps

  validates :name, presence: true

  default_scope { order(sequence: :asc) }
end
