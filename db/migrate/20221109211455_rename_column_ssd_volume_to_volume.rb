class RenameColumnSsdVolumeToVolume < ActiveRecord::Migration[7.0]
  def change
    rename_column :dataloggers, :ssd_volume, :volume
  end
end
