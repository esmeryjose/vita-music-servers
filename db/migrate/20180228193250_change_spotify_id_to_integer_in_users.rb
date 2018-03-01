class ChangeSpotifyIdToIntegerInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :spotify_id, :string
  end
end
