class ChildcareComment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :childcare
end
