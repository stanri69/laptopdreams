class CreateDataloggers < ActiveRecord::Migration[7.0]
  def change
    create_table :dataloggers do |t|
      t.integer :volume
      t.string :type_datalogger

      t.timestamps
    end
  end
end
