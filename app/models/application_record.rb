class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def acceptable_image
    return unless category_icon.attached?

    errors.add(:category_icon, 'is too big') unless category_icon.blob.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png', 'image/svg']
    return if acceptable_types.include?(category_icon.content_type)

    errors.add(:category_icon, 'must be a JPEG or PNG or SVG')
  end
end
