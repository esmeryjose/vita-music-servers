class RemoveColumnCountAndPendingFromVotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :votes, :count
    remove_column :votes, :pending
  end
end
