class RemoveAdminIdColumnFromEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :admin_id
  end
end
