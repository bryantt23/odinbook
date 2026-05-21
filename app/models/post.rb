class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes 
  has_many :users_who_liked, through: :likes, source: :user
end
