json.array!(@participants) do |participant|
  json.extract! participant, :id, :player_id, :game_id, :score
  json.url participant_url(participant, format: :json)
end
