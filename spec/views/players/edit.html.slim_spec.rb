require 'rails_helper'

RSpec.describe "players/edit", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :name => "MyString",
      :email => "MyString",
      :hand => "MyString",
      :grade => 1
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_email[name=?]", "player[email]"

      assert_select "input#player_hand[name=?]", "player[hand]"

      assert_select "input#player_grade[name=?]", "player[grade]"
    end
  end
end
