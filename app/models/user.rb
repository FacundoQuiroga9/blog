class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :posts, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validate :username_no_spaces


  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def username_no_spaces
    if username && username.include?(" ")
      errors.add(:username, "no puede contener espacios.")
    end
  end
end
