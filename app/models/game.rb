class Game < ActiveRecord::Base
  validates :players, length: { minimum: 2 }

  has_many :participations
  has_many :players, through: :participations
end
