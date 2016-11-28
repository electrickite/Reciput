class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :food

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
