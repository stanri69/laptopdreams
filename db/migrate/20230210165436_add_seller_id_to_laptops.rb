class AddSellerIdToLaptops < ActiveRecord::Migration[7.0]
  def change
    add_column :laptops, :seller_id, :integer
  end
end
