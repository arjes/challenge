class Participation < ActiveRecord::Base
  validates :score, numericality: { greater_than_or_equal_to: 0 }
  validates :player, :game, presence: true
end
