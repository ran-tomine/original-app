class Event < ApplicationRecord

  validates :name,        presence: true
  validates :location,    presence: true
  validates :datetime,    presence: true
  validates :description, presence: true
  validates :image,       presence: true
  

  belongs_to :user
  has_one_attached :image
  has_many :event_comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    if search != ""
      Event.where('name LIKE(?)', "%#{search}%")
    else
      Event.all
    end
  end

end
