class Player < ActiveRecord::Base
  has_many :participations
  has_many :games, through: :participations

  has_many :participations_of_all_games,
    source: :participations, through: :games

  validates :name, presence: true

  validates :email, format: {
    # Being intentionally permissive on e-mail validation since the RFC is
    # much more permissive then most validation.
    with: /\A[^@]+@[^@]+\z/,
    message: "should look like an e-mail"
  }

  validates :hand, inclusion: {
    in: %w(left right),
    message: "'%{value}' is not a valid, please select right or left"
  }

  validates :grade,  numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100,
    message: 'should be between 0 and 100'
  }, allow_nil: true

  def update_grade
    # Score is Points Scored / Total of all points in all games
    self.grade = 100 *
            participations.sum(:score).to_f / participations_of_all_games.sum(:score)
  end

  def update_grade!
    update_grade
    save!
  end
end
