class CreateCorps < ActiveRecord::Migration[7.0]
  def change
    create_table :corps do |t|
      t.string :color
      t.integer :weight
      t.string :sound_system
      t.string :manipulators
      t.string :dimensions
      t.string :body_material

      t.timestamps
    end
  end
end
