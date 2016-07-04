class RecipePolicy < ApplicationPolicy
  def create?
    signed_in?
  end

  def update?
    signed_in? && record.editors.include?(user)
  end

  def change_owner?
    signed_in? && record.owner == user
  end

  def destroy?
    change_owner?
  end
end
