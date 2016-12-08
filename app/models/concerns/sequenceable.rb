module Sequenceable
  extend ActiveSupport::Concern

  included do
    before_create :set_sequence
    validates :sequence, presence: true
    default_scope { order(sequence: :asc) }
  end

  private

  def set_sequence
    relationship = self.class.reflect_on_association(:recipe).has_inverse?
    if self.sequence.zero? && recipe.send(relationship).any?
      self.sequence = recipe.send(relationship).last.sequence.to_i + 1
    end
  end
end
