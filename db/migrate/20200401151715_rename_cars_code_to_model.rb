class RenameCarsCodeToModel < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :code, :model
  end
end
