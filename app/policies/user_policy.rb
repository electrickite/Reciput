class UserPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    update?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user == record
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
