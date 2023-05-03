class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  validate :acceptable_image

  private
  def acceptable_image
    return unless image.attached?
  
    unless image.blob.byte_size <= 1.megabyte
      errors.add(:main_image, "is too big")
    end
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end
end
