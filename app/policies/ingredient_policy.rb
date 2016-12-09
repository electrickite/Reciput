class IngredientPolicy < ApplicationPolicy
  def update?
    record.recipe.editors.include?(user)
  end

  alias_method :create?, :update?
  alias_method :destroy?, :update?
  alias_method :sort?, :update?

  def permitted_attributes_for_create
    permitted_attributes_for_update << :recipe_id
  end

  def permitted_attributes_for_update
    [:food_id, :amount, :unit, :notes]
  end
end
