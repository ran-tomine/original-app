class Event < ApplicationRecord

  validates :name,        presence: true, length: { maximum: 30 }
  validates :location,    presence: true, length: { maximum: 30 }
  validates :datetime,    presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :image,       presence: true
  validate :four_digit_year
  validate :future_datetime

  def four_digit_year
    if datetime.present? && datetime.year.to_s.length != 4
      errors.add(:datetime, "の西暦は4桁である必要があります。")
    end
  end

  def future_datetime
    if datetime.present? && datetime < Time.now
      errors.add(:datetime, "は未来の日時を設定してください。")
    end
  end

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
