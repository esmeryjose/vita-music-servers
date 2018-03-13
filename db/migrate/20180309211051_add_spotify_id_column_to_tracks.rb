class AddSpotifyIdColumnToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :spotify_id, :string
  end
end
