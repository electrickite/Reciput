module Imageable
  extend ActiveSupport::Concern

  attr_accessor :delete_image

  included do
    before_save :check_for_image_deletion

    has_attached_file :image, styles: { medium: ['400x400>', :png], thumb: ['100x100#', :png] }

    validates_attachment :image,
      size: { less_than: 3.megabytes },
      content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
  end

  private

  def check_for_image_deletion
    unless delete_image.blank? || delete_image.to_i.zero?
      self.image = nil
    end
  end
end
