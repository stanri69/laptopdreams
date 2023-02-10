class AddRamToLaptop < ActiveRecord::Migration[7.0]
  def change
    add_reference :laptops, :ram, null: false, foreign_key: true
  end
end
