class AddIndexForTracksName < ActiveRecord::Migration[6.0]
  def change
    add_index :tracks, :name
  end
end
