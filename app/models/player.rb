class Player < ActiveRecord::Base
  has_many :participations
  has_many :games, through: :participations
  
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
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100,
    message: 'should be between 0 and 100'
  }

  def update_score
    # Do something here
  end

  def update_score!
    update_score
    save!
  end
end
