# app/models/event.rb
class Event < ApplicationRecord
    belongs_to :park

  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true

  end
  