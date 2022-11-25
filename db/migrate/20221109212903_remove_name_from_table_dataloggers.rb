class RemoveNameFromTableDataloggers < ActiveRecord::Migration[7.0]
  def change
    remove_column :dataloggers, :name, :string
  end
end
