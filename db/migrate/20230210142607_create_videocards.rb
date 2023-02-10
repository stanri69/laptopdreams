class CreateVideocards < ActiveRecord::Migration[7.0]
  def change
    create_table :videocards do |t|
      t.string :type_videocard
      t.string :name
      t.text :description
      t.integer :amount_memory

      t.timestamps
    end
  end
end
