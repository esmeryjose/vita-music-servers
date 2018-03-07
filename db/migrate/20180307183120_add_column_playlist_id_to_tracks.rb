class AddColumnPlaylistIdToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :playlist_id, :integer
  end
end
