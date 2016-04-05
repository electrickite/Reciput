module RecipesHelper
  def format_time(time)
    distance_of_time_in_words(time*60)
  end

  def format_amount(amount=0)
    amount.to_f.zero? ? '' : number_to_fraction(amount)
  end

  def number_to_fraction(amount)
    amount_as_integer = amount.to_i
    if amount_as_integer != amount.to_f && amount > 0
      fraction = (amount - amount_as_integer).to_r.rationalize(Rational('0.01'))
      if amount_as_integer > 0
        "#{amount_as_integer} #{fraction}"
      else
        "#{fraction}"
      end
    else
      amount_as_integer.to_s
    end
  end

  def recipe_actions(recipe, back_path=false)
    links = []
    links << link_to('Edit', edit_recipe_path(recipe)) if policy(recipe).edit?
    links << link_to('Delete', recipe, method: :delete, data: { confirm: 'Are you sure?' }) if policy(recipe).destroy?
    links << link_to('Back', back_path) if back_path.present?
    links.join(' | ').html_safe
  end
end
