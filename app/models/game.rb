class Game < ActiveRecord::Base
  validates :participations, length: {
    minimum: 2,
    message: 'at least two players are required'
  }

  has_many :participations
  has_many :players, through: :participations

  accepts_nested_attributes_for :participations, allow_destroy: true

  after_save :update_player_scores

  def update_player_scores
    self.players.map(&:update_grade!)
  end
end
