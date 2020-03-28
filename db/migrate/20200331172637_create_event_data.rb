class CreateEventData < ActiveRecord::Migration[6.0]
  def change
    create_table :event_data do |t|
      t.integer :packet_id
      t.binary :content

      t.timestamps
    end
  end
end
