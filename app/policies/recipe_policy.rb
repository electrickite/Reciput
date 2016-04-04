class RecipePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    @record.user == @user
  end

  def destroy?
    update?
  end
end
