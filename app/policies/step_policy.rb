class StepPolicy < ApplicationPolicy
  def update?
    signed_in? && record.recipe.editors.include?(user)
  end

  alias_method :create?, :update?
  alias_method :destroy?, :update?
  alias_method :sort?, :update?
end
