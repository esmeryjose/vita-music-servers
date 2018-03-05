class AddDefaultNumberToVotes < ActiveRecord::Migration[5.1]
  def change
    change_column :votes, :count, :integer, default: 0
  end
end
