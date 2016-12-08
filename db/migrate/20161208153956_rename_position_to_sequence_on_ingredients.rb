class RenamePositionToSequenceOnIngredients < ActiveRecord::Migration
  def change
    rename_column :ingredients, :position, :sequence
  end
end
