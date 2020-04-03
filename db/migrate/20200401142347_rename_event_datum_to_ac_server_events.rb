class RenameEventDatumToAcServerEvents < ActiveRecord::Migration[6.0]
  def change
    rename_table :event_data, :ac_server_events
  end
end
