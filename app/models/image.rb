class Image < ApplicationRecord
  paginates_per 10

  belongs_to :user
  mount_uploader :file, ImageUploader
end
