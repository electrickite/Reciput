module FoodsHelper

  def food_actions(food, back_path=false)
    links = []
    links << link_to('Edit', edit_food_path(food)) if policy(food).edit?
    links << link_to('Delete', food, method: :delete, data: { confirm: 'Are you sure?' }) if policy(food).destroy?
    links << link_to('Back', back_path) if back_path.present?
    links.join(' | ').html_safe
  end

end
