class AddAdditionallyToLaptop < ActiveRecord::Migration[7.0]
  def change
    add_reference :laptops, :additionally, null: false, foreign_key: true
  end
end
