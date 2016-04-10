class Food < ActiveRecord::Base
  has_many :ingredients, inverse_of: :food, dependent: :destroy
  has_many :recipes, through: :ingredients

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
