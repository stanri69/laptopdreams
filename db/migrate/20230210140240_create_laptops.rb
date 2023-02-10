class CreateLaptops < ActiveRecord::Migration[7.0]
  def change
    create_table :laptops do |t|
      t.string :full_name
      t.integer :price
      t.text :description
      t.string :brand
      t.string :op
      t.string :type_laptop

      t.timestamps
    end
  end
end
