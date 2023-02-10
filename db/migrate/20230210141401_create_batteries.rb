class CreateBatteries < ActiveRecord::Migration[7.0]
  def change
    create_table :batteries do |t|
      t.string :battery_capacity
      t.integer :battery_life

      t.timestamps
    end
  end
end
