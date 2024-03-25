class Post < ApplicationRecord
  has_rich_text :description
  belongs_to :user
  has_many_attached :images 


  validates :title, presence: true
  validates :content, presence: true
end
