class Ingredient < ActiveRecord::Base
  include Sequenceable

  belongs_to :recipe, inverse_of: :ingredients
  belongs_to :food, inverse_of: :ingredients

  validates :recipe, :food, presence: true

  delegate :name, to: :food
  delegate :user, to: :recipe

  def amount(modifier=nil)
    if self[:amount].blank? || modifier.to_f.zero?
      self[:amount]
    else
      modifier * self[:amount]
    end
  end
end
