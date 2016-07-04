class IngredientPolicy < ApplicationPolicy
  def create?
    update?
  end

  def update?
    signed_in? && record.recipe.editors.include?(user)
  end

  def destroy?
    update?
  end
end
