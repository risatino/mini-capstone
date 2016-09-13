class DropImagesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :images
  end
end
