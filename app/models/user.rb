class User < ApplicationRecord
  has_many :images
  has_many :active_relationships, class_name: Relationship.name,
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
           foreign_key: "followed_id",
           dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  def newsfeed page = 1
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Image.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id).order(id: :desc)
  end
end
