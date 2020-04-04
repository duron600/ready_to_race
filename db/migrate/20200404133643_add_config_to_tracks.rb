class AddConfigToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :config, :string
  end
end
