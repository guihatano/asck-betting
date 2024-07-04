# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable

  has_many :bets, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def update_points(points)
    self.points += points
    save
  end
end
