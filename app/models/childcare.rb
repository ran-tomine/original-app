class Childcare < ApplicationRecord

  validates :title, presence: true
  validates :diary, presence: true

  belongs_to :user
  has_one_attached :image
end
