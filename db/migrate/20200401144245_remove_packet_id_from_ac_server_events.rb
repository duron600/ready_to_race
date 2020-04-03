class RemovePacketIdFromAcServerEvents < ActiveRecord::Migration[6.0]
  def up
    remove_column :ac_server_events, :packet_id
  end

  def down
    add_column :ac_server_events, :packet_id, :integer
  end
end
