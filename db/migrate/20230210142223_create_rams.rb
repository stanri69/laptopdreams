class CreateRams < ActiveRecord::Migration[7.0]
  def change
    create_table :rams do |t|
      t.integer :amount
      t.integer :number_slot
      t.string :type_ram

      t.timestamps
    end
  end
end
