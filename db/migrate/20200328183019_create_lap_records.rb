class CreateLapRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :lap_records do |t|
      t.bigint :racer_id
      t.bigint :car_id
      t.bigint :track_id
      t.string :lap_time
      t.integer :lap_time_ms

      t.timestamps
    end
  end
end
