# app/models/event.rb
class Event < ApplicationRecord
  has_many :bets, dependent: :destroy

  enum status: { upcoming: 0, ongoing: 1, completed: 2 }

  validates :name, presence: true
  validates :date, presence: true
end
