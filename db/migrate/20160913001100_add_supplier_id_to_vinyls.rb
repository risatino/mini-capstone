class AddSupplierIdToVinyls < ActiveRecord::Migration[5.0]
  def change
    add_column :vinyls, :supplier_id, :integer
  end
end
