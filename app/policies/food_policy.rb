class FoodPolicy < ApplicationPolicy
  def create?
    signed_in?
  end

  def update?
    signed_in?
  end

  def destroy?
    update?
  end
end
