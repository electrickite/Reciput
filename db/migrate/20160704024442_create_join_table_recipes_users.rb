class CreateJoinTableRecipesUsers < ActiveRecord::Migration
  def change
    create_join_table :recipes, :users
  end
end
