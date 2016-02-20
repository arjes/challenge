require 'rails_helper'

RSpec.describe "participants/show", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :player_id => 1,
      :game_id => 2,
      :score => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
