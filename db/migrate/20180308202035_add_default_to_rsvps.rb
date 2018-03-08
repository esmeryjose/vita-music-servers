class AddDefaultToRsvps < ActiveRecord::Migration[5.1]
  def change
    change_column :rsvps, :accepted, :boolean, default: false
  end
end
