# frozen_string_literal: true

class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { pending: 0, won: 1, lost: 2 }

  validates :value, presence: true
  validates :predicted_result, presence: true
  validates :status, presence: true

  def process_result
    if actual_result == predicted_result
      user.update_points(value)
      update(status: :won)
    else
      user.update_points(-value)
      update(status: :lost)
    end
  end
end
