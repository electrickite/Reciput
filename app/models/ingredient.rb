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

  def amount=(value)
    self[:amount] = value.to_s.gsub(/\s+/, '').to_r.to_f
  rescue ZeroDivisionError
    self[:amount] = 0.0
  end
end
