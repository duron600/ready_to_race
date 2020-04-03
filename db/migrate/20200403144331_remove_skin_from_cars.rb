class RemoveSkinFromCars < ActiveRecord::Migration[6.0]
  def up
    remove_column :cars, :skin
  end

  def down
    add_column :cars, :skin, :string
  end
end
