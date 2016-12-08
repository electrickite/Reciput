class Step < ActiveRecord::Base
  belongs_to :recipe

  before_create :set_sequence

  validates :directions, :sequence, presence: true
  validates :recipe, presence: true

  default_scope { order(sequence: :asc) }

  def number
    recipe.steps.map(&:id).index(self.id).to_i + 1
  end

  private

  def set_sequence
    if self.sequence.zero? && recipe.steps.any?
      self.sequence = recipe.steps.last.sequence.to_i + 1
    end
  end
end
