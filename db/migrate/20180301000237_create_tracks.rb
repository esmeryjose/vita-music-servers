class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artists
      t.string :uri

      t.timestamps
    end
  end
end
