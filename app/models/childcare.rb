class Childcare < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :diary, presence: true, length: { maximum: 1000 }

  belongs_to :user
  has_one_attached :image
  has_many :childcare_comments, dependent: :destroy
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Childcare.where('title LIKE(?)', "%#{search}%")
    else
      Childcare.all
    end
  end

end
