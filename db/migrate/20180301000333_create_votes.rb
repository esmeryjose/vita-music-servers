class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :track_id
      t.integer :user_id
      t.boolean :pending, default: true

      t.timestamps
    end
  end
end
