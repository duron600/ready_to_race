class CreateUdpData < ActiveRecord::Migration[6.0]
  def change
    create_table :udp_data do |t|
      t.binary :content

      t.timestamps
    end
  end
end
