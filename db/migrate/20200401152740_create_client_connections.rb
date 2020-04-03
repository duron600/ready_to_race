class CreateClientConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :client_connections do |t|
      t.bigint :car_id
      t.integer :car_index
      t.bigint :driver_id
      t.datetime :closed_at

      t.timestamps
    end

    add_index :client_connections, :car_id
    add_index :client_connections, [:driver_id, :car_id]
  end
end
