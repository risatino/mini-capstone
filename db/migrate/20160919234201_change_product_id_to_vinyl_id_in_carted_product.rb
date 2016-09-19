class ChangeProductIdToVinylIdInCartedProduct < ActiveRecord::Migration[5.0]
  def change
    rename_column :carted_products, :product_id, :vinyl_id
  end
end
