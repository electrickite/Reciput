class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :food

  before_create :set_position

  validates :recipe, :food, :position, presence: true

  default_scope { order(position: :asc) }

  delegate :name, to: :food
  delegate :user, to: :recipe

  def amount(modifier=nil)
    if self[:amount].blank? || modifier.to_f.zero?
      self[:amount]
    else
      modifier * self[:amount]
    end
  end

  private

  def set_position
    if self.position.zero? && recipe.ingredients.any?
      self.position = recipe.ingredients.last.position.to_i + 1
    end
  end
end
