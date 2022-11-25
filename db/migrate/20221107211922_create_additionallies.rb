class CreateAdditionallies < ActiveRecord::Migration[7.0]
  def change
    create_table :additionallies do |t|
      t.string :additionally_features
      t.string :producing_country
      t.string :supply_set
      t.string :registration
      t.string :guarantee

      t.timestamps
    end
  end
end
