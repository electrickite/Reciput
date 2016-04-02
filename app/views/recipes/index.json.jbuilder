json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :description, :active_time, :total_time, :yield, :equipment
  json.url recipe_url(recipe, format: :json)
end
