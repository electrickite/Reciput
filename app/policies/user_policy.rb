class UserPolicy < ApplicationPolicy
  def index?
    false
  end

  alias_method :show?, :update?

  def create?
    false
  end

  alias_method :new?, :create?

  def update?
    user == record
  end

  alias_method :edit?, :update?

  def destroy?
    false
  end
end
