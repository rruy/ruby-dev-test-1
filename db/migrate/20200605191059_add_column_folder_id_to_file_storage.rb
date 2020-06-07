class AddColumnFolderIdToFileStorage < ActiveRecord::Migration[5.0]
  def change
    add_column :file_storages, :folder_id, :integer
  end
end
