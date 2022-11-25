class AddVideocardToLaptop < ActiveRecord::Migration[7.0]
  def change
    add_reference :laptops, :videocard, null: false, default: 1, foreign_key: true
  end
end
