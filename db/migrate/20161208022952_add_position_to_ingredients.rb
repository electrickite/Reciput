class AddPositionToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :position, :integer, null: false, default: 0
  end
end
