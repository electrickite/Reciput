class FoodPolicy < ApplicationPolicy
  def create?
    signed_in?
  end

  alias_method :update?, :create?
  alias_method :destroy?, :create?

  def permitted_attributes
    [:name, :description, :image, :delete_image]
  end
end
