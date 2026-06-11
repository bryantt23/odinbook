class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :post_likes, through: :likes, source: :post
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: :friendship, foreign_key: :friend_id
  has_many :inverse_friends, through: :inverse_friendships, source: :user
end
