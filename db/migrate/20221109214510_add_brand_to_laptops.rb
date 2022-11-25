class AddBrandToLaptops < ActiveRecord::Migration[7.0]
  def change
    add_column :laptops, :brand, :string
    add_column :laptops, :op, :string
    add_column :laptops, :type_laptop, :string
  end
end
