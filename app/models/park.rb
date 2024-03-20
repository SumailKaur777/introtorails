# app/models/park.rb
class Park < ApplicationRecord
  has_many :events
  has_many :activities
  has_many :facilities
  # belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :size, presence: true
  # validates :amenities, presence: true

  # validates :park_category, presence: true
  validates :district, presence: true
  validates :classification_type, presence: true
  validates :neighbourhood, presence: true
end
