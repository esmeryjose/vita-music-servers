class AddColumnEventIdToPlaylist < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :event_id, :integer
  end
end
