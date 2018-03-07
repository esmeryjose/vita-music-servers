class AddColumnPendingToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :pending, :boolean, default: true
  end
end
