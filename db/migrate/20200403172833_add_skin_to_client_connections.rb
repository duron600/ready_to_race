class AddSkinToClientConnections < ActiveRecord::Migration[6.0]
  def change
    add_column :client_connections, :skin, :string
  end
end
