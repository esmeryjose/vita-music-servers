class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :description
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
