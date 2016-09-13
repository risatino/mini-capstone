class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image_1
      t.string :image_2
      t.string :image_3

      t.timestamps
    end
  end
end
