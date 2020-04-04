class AddIndexForTracksNameAndConfig < ActiveRecord::Migration[6.0]
  def change
    add_index :tracks, [:name, :config]
  end
end
