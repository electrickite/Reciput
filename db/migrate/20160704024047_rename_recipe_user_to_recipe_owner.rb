class RenameRecipeUserToRecipeOwner < ActiveRecord::Migration
  def change
    rename_column :recipes, :user_id, :owner_id
  end
end
