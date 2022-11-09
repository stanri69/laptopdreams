class AddTypeDataloggerToDataloggers < ActiveRecord::Migration[7.0]
  def change
    add_column :dataloggers, :type_datalogger, :string
  end
end
