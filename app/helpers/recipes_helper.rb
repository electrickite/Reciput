module RecipesHelper
  def format_time(time)
    distance_of_time_in_words(time*60)
  end

  def numeric_to_mixed_number(amount)
    amount_as_integer = amount.to_i
    if (amount_as_integer != amount.to_f) && (amount_as_integer > 0)
      fraction = amount - amount_as_integer
      "#{amount_as_integer} #{fraction.to_r.rationalize(Rational('0.01'))}"
    else
      amount_as_integer.to_s
    end
  end
end
