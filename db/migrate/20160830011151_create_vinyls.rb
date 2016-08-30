class CreateVinyls < ActiveRecord::Migration[5.0]
  def change
    create_table :vinyls do |t|
      t.string :artist_name
      t.string :record_title
      t.string :genre
      t.string :description
      t.integer :playtime
      t.string :label
      t.integer :price

      t.timestamps
    end
  end
end
