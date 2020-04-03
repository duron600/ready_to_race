class CreateLaps < ActiveRecord::Migration[6.0]
  def change
    create_table :laps do |t|
      t.bigint :session_participation_id
      t.integer :time
      t.integer :cuts
      t.integer :cars_count

      t.timestamps
    end
  end
end
