class RecipePolicy < ApplicationPolicy
  def create?
    signed_in?
  end

  def update?
    signed_in? && @record.user == @user
  end

  def destroy?
    update?
  end
end
