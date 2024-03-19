class Facility < ApplicationRecord
    belongs_to :park
  validates :name, presence: true
  validates :description, presence: true

  end