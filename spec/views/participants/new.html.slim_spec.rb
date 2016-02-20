require 'rails_helper'

RSpec.describe "participants/new", type: :view do
  before(:each) do
    assign(:participant, Participant.new(
      :player_id => 1,
      :game_id => 1,
      :score => 1
    ))
  end

  it "renders new participant form" do
    render

    assert_select "form[action=?][method=?]", participants_path, "post" do

      assert_select "input#participant_player_id[name=?]", "participant[player_id]"

      assert_select "input#participant_game_id[name=?]", "participant[game_id]"

      assert_select "input#participant_score[name=?]", "participant[score]"
    end
  end
end
