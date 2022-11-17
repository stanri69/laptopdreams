class AddDataloggerToLaptop < ActiveRecord::Migration[7.0]
  def change
    add_reference :laptops, :datalogger, null: false, default: 2, foreign_key: true
  end
end
