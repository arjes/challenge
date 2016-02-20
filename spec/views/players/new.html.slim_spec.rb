require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      :name => "MyString",
      :email => "MyString",
      :hand => "MyString",
      :grade => 1
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_email[name=?]", "player[email]"

      assert_select "input#player_hand[name=?]", "player[hand]"

      assert_select "input#player_grade[name=?]", "player[grade]"
    end
  end
end
