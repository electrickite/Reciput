class IngredientPolicy < ApplicationPolicy
  def create?
    update?
  end

  def update?
    record.recipe.user == user
  end

  def destroy?
    update?
  end
end
