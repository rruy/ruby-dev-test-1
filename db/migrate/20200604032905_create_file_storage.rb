class CreateFileStorage < ActiveRecord::Migration[5.0]
  def change
    create_table :file_storages do |t|
      t.string :file_name
      t.string :file_path
      t.string :object_key
      t.integer :file_type
      t.binary :data
    end
    add_index :file_storages, :file_type
  end
end
