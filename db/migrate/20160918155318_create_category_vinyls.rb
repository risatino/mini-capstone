class CreateCategoryVinyls < ActiveRecord::Migration[5.0]
  def change
    create_table :category_vinyls do |t|
      t.integer :category_id
      t.integer :vinyl_id

      t.timestamps
    end
  end
end
