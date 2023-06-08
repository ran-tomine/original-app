class Event < ApplicationRecord

  validates :name,        presence: true
  validates :location,    presence: true
  validates :datetime,    presence: true
  validates :description, presence: true
  validates :image,       presence: true

  belongs_to :user
  has_one_attached :image
  has_many :event_comments, dependent: :destroy

end
