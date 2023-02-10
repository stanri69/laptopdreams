class CreateProcessors < ActiveRecord::Migration[7.0]
  def change
    create_table :processors do |t|
      t.string :name
      t.boolean :operating_system
      t.integer :clock_frequency
      t.integer :number_cores

      t.timestamps
    end
  end
end
