module IngredientsHelper

  def ingredient_actions(ingredient)
    links = []
    links << link_to('Edit', edit_recipe_ingredient_path(ingredient.recipe, ingredient)) if policy(ingredient).edit?
    links << link_to('Remove', recipe_ingredient_path(ingredient.recipe, ingredient), method: :delete, data: { confirm: 'Are you sure?' }) if policy(ingredient).destroy?
    links.join(' | ').html_safe
  end

end
