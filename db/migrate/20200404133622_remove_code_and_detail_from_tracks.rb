class RemoveCodeAndDetailFromTracks < ActiveRecord::Migration[6.0]
  def up
    remove_column :tracks, :code
    remove_column :tracks, :detail
  end

  def down
    add_column :tracks, :code, :string
    add_column :tracks, :detail, :string
  end
end
