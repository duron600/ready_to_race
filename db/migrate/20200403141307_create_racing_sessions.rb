class CreateRacingSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :racing_sessions do |t|
      t.integer :index
      t.integer :current_index
      t.integer :count
      t.string :server_name
      t.string :track_name
      t.string :track_config
      t.string :name
      t.integer :typ
      t.integer :time
      t.integer :laps
      t.integer :wait_time
      t.integer :ambient_temperature
      t.integer :road_temperature
      t.string :weather_graphics
      t.string :elapsed_ms
      t.string :json_file
      t.datetime :end_at

      t.timestamps
    end
  end
end
