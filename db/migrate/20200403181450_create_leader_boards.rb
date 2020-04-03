class CreateLeaderBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :leader_boards do |t|
      t.bigint :lap_id
      t.bigint :session_participation_id
      t.integer :rtime
      t.integer :rlaps

      t.timestamps
    end
  end
end
