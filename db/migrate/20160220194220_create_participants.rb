class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
