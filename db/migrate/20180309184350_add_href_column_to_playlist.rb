class AddHrefColumnToPlaylist < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :href, :string
  end
end
