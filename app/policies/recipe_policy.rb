class RecipePolicy < ApplicationPolicy
  def create?
    signed_in?
  end

  def update?
    record.editors.include?(user)
  end

  def change_owner?
    record.owner == user
  end

  def destroy?
    change_owner?
  end

  def permitted_attributes_for_create
    [:name, :description, :active_time, :total_time, :yield, :equipment, :image,
      :delete_image, user_ids: []]
  end

  def permitted_attributes_for_update
    attributes = permitted_attributes_for_create
    attributes << :owner_id if change_owner?
    attributes
  end
end
