require 'spec_helper'

feature 'Game creation' do
  it 'has a button to add rows', js: true do
    # Factories...
    player = Player.create(name: 'Brian', hand: 'Left', email: 'asf@asdf')

    visit(games_path)

    click_link "New Game"

    select player.name, from: 'all_players'

    # No expect to change count?
    expect(page).to_not have_selector('.participant_rows')

    click_link "Add Participant"

    expect(page).to have_selector('.participant_rows', count: 1)
  end
end
