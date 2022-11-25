class AddAmountMemoryToVideocards < ActiveRecord::Migration[7.0]
  def change
    add_column :videocards, :amount_memory, :integer
  end
end
