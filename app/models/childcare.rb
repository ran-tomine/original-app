class Childcare < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true
  validates :diary, presence: true

  belongs_to :user
  has_one_attached :image
  has_many :childcare_comments, dependent: :destroy
  has_many :likes
end
