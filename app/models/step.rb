class Step < ActiveRecord::Base
  belongs_to :recipe

  validates :directions, :sequence, presence: true
  validates :recipe, presence: true

  default_scope { order(sequence: :asc) }

  def number
    recipe.steps.map(&:id).index(self.id).to_i + 1
  end
end
