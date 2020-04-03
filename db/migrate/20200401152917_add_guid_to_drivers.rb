class AddGuidToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :guid, :string
    add_index :drivers, :guid
  end
end
