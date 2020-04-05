class AddDriverNameAndCarModelToLaps < ActiveRecord::Migration[6.0]
  def change
    add_column :laps, :driver_name, :string
    add_column :laps, :car_model, :string
  end
end
