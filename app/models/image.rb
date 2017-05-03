class Image < ApplicationRecord
  paginates_per 8

  belongs_to :user
  mount_uploader :file, ImageUploader
end
