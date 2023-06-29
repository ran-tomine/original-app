class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :profile,  presence: true, length: { maximum: 1000}
  validates :image, presence: true, allow_blank: true

  has_one_attached :image
  has_many :childcares
  has_many :childcare_comments
  has_many :events
  has_many :event_comments

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    follower =  passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end

  has_many :likes

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

end
