module RecipesHelper
  def format_time(time)
    distance_of_time_in_words(time*60)
  end
end
