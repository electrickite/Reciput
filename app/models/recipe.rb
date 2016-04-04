class Recipe < ActiveRecord::Base
  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :steps, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
