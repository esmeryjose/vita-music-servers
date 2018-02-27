class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :profile_img_url
      t.integer :spotify_id
      t.string :spotify_url
      t.string :uri
      t.string :access_token
      t.string :refresh_token
    end
  end
end
