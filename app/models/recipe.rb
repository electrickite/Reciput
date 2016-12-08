class Recipe < ActiveRecord::Base
  include Imageable

  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :steps, dependent: :destroy, inverse_of: :recipe
  belongs_to :owner, class_name: 'User', inverse_of: :recipes
  has_and_belongs_to_many :users, inverse_of: :shared_recipes

  validates :name, presence: true

  def editors
    (users.all << owner).uniq
  end
end
