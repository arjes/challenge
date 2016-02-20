json.array!(@players) do |player|
  json.extract! player, :id, :name, :email, :hand, :grade
  json.url player_url(player, format: :json)
end
