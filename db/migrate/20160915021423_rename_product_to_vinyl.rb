class RenameProductToVinyl < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :product_id, :vinyl_id
  end
end
