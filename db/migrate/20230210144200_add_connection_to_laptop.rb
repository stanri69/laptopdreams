class AddConnectionToLaptop < ActiveRecord::Migration[7.0]
  def change
    add_reference :laptops, :connection, null: false, foreign_key: true
  end
end
