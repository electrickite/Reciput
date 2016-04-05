class IngredientPolicy < ApplicationPolicy
  def create?
    update?
  end

  def update?
    signed_in? && record.recipe.user == user
  end

  def destroy?
    update?
  end
end
