class AddProcessorToLaptop < ActiveRecord::Migration[7.0]
  def change
    add_reference :laptops, :processor, null: false, default: 1, foreign_key: true
  end
end
