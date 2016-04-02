class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :active_time
      t.integer :total_time
      t.string :yield
      t.text :equipment

      t.timestamps null: false
    end
    add_index :recipes, :name
    add_index :recipes, :active_time
    add_index :recipes, :total_time
  end
end
