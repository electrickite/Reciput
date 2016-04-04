class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :food

  validates :recipe, :food, presence: true

  delegate :name, to: :food
  delegate :user, to: :recipe
end
