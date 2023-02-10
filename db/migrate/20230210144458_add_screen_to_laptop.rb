class AddScreenToLaptop < ActiveRecord::Migration[7.0]
  def change
    add_reference :laptops, :screen, null: false, foreign_key: true
  end
end
