class AddTimeAndDateColumnsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_date, :string, default: ""
    add_column :events, :starting_time, :string, default: ""
    add_column :events, :ending_time, :string, default: ""
  end
end
