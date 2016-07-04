class StepPolicy < ApplicationPolicy
  def create?
    update?
  end

  def update?
    signed_in? && record.recipe.owner == user
  end

  def destroy?
    update?
  end
end
