class Step < ActiveRecord::Base
  belongs_to :recipe
  validates :directions, :sequence, presence: true
end
