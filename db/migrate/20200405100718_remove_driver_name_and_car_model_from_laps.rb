class RemoveDriverNameAndCarModelFromLaps < ActiveRecord::Migration[6.0]
  def up
    remove_column :laps, :driver_name
    remove_column :laps, :car_model
  end

  def down
    add_column :laps, :driver_name, :string
    add_column :laps, :car_model, :string
  end
end
