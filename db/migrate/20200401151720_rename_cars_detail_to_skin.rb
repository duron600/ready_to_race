class RenameCarsDetailToSkin < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :detail, :skin
  end
end
