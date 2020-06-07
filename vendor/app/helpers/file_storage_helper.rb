require 'securerandom'

module FileStorageHelper

  def nodes(root)
    html = ''
    html << "<li data-id='#{root.id}' data-name='#{root.name}' data-type='folder' role='treeitem' aria-expanded='false'>"
    html << "<span style='padding: 10px;'> #{root.id} - #{root.name}</span>"
    html << '<ul role="group">'
    root.sub_folders.each do |sub_folder|
      html << nodes(sub_folder)
    end
    html << get_files(root)
    html << '</ul>'
    html << '</li>'
    html
  end

  def get_files(node)
    html = ''
    files = FileStorage.where(folder_id: node.id)
    files.each do |file|
      html << "<li data-id='#{file.id}' data-name='#{file.file_name}' data-type='file'  role='treeitem' class='doc'>#{file.file_name}</li>"
    end
    html
  end
end
