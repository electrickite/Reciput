class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :recipe, index: true, foreign_key: true
      t.text :directions, null: false
      t.integer :sequence, null: false, default: 0

      t.timestamps null: false
    end
    add_index :steps, :sequence
  end
end
