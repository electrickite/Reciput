class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true
      t.float :amount
      t.string :unit
      t.text :notes

      t.timestamps null: false
    end
  end
end
