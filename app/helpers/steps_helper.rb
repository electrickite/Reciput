module StepsHelper

  def step_actions(step)
    links = []
    links << link_to('Edit', edit_recipe_step_path(step.recipe, step)) if policy(step).edit?
    links << link_to('Remove', recipe_step_path(step.recipe, step), method: :delete, data: { confirm: 'Are you sure?' }) if policy(step).destroy?
    links.join(' | ').html_safe
  end

end
