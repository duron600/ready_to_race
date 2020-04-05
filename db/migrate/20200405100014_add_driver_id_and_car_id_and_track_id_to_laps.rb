class AddDriverIdAndCarIdAndTrackIdToLaps < ActiveRecord::Migration[6.0]
  def change
    add_column :laps, :driver_id, :bigint
    add_column :laps, :car_id, :bigint
    add_column :laps, :track_id, :bigint

    add_index :laps, :driver_id
    add_index :laps, :car_id
    add_index :laps, :track_id
  end
end
