class AddNumberCoresToProcessors < ActiveRecord::Migration[7.0]
  def change
    add_column :processors, :number_cores, :integer
  end
end
