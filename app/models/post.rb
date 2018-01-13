class Post < ApplicationRecord

  mount_uploader :photo, PhotoUploader
  
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :photo, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
end
