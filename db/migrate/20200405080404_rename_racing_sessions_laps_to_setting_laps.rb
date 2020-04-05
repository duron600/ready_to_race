class RenameRacingSessionsLapsToSettingLaps < ActiveRecord::Migration[6.0]
  def change
    rename_column :racing_sessions, :laps, :setting_laps
  end
end
