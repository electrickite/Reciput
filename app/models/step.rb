class Step < ActiveRecord::Base
  include Sequenceable

  belongs_to :recipe, inverse_of: :steps

  validates :recipe, :directions, presence: true

  def number
    recipe.steps.map(&:id).index(self.id).to_i + 1
  end
end
