class AddVinylIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :vinyl_id, :integer
  end
end
