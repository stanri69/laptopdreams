class CreateScreens < ActiveRecord::Migration[7.0]
  def change
    create_table :screens do |t|
      t.string :diagonal
      t.string :screen_type
      t.integer :resolution
      t.integer :refresh_rate
      t.boolean :built_camera

      t.timestamps
    end
  end
end
