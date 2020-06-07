class Folder < ApplicationRecord
  belongs_to :main_folder, :class_name => "Folder", :foreign_key => "parent_id", optional: true

  def sub_folders
    Folder.where(parent_id: self.id)
  end
end
