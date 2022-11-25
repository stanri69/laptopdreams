class CreateDataloggers < ActiveRecord::Migration[7.0]
  def change
    create_table :dataloggers do |t|
      t.integer :ssd_volume
      t.string :name

      t.timestamps
    end
  end
end
