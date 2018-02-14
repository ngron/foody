class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :reply, class_name: "Comment", optional: true
  
  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end
