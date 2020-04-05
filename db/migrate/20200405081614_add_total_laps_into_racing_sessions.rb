class AddTotalLapsIntoRacingSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :racing_sessions, :total_laps, :integer, :default => 0
  end
end
