class Course < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :descriptions, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
