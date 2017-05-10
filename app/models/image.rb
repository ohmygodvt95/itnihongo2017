class Image < ApplicationRecord
  paginates_per 10

  belongs_to :user

  has_many :likes
  has_many :comments

  mount_uploader :file, ImageUploader
end
