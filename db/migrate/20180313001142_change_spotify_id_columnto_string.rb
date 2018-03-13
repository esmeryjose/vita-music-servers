class ChangeSpotifyIdColumntoString < ActiveRecord::Migration[5.1]
  def change
    change_column :playlists, :spotify_id, :string
  end
end
