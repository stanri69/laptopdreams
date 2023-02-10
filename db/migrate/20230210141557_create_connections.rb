class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.boolean :network_adapters
      t.string :ports
      t.string :wireless_communication

      t.timestamps
    end
  end
end
