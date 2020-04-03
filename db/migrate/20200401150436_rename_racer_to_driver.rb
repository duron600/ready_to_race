class RenameRacerToDriver < ActiveRecord::Migration[6.0]
  def change
    rename_table :racers, :drivers
  end
end
