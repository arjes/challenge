class Game < ActiveRecord::Base
  validates :participations, length: { minimum: 2 }

  has_many :participations
  has_many :players, through: :participations

  accepts_nested_attributes_for :participations, allow_destroy: true
end
