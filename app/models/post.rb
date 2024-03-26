class Post < ApplicationRecord
  has_rich_text :description
  belongs_to :user
  has_one_attached :image


  validates :title, presence: true
end
