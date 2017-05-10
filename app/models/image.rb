class Image < ApplicationRecord
  paginates_per 10

  belongs_to :user

  has_many :likes

  mount_uploader :file, ImageUploader
end
