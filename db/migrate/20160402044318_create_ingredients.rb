class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true
      t.float :amount, null: false
      t.string :unit, null: false
      t.text :notes

      t.timestamps null: false
    end
  end
end
