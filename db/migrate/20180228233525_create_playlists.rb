class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :spotify_id
      t.string :uri

      t.timestamps
    end
  end
end
