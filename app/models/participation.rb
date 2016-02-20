class Participation < ActiveRecord::Base
  validates :score, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :game
  belongs_to :player
end
