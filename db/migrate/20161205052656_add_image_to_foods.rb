class AddImageToFoods < ActiveRecord::Migration
  def change
    add_attachment :foods, :image
  end
end
