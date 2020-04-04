class AddTrackIdToRacingSessionsAndRemoveTrackNameAndConfig < ActiveRecord::Migration[6.0]
  def up
    add_column :racing_sessions, :track_id, :bigint
    remove_column :racing_sessions, :track_name
    remove_column :racing_sessions, :track_config

    add_index :racing_sessions, :track_id
  end

  def down
    remove_column :racing_sessions, :track_id
    add_column :racing_sessions, :track_name, :string
    add_column :racing_sessions, :track_config, :string
  end
end
