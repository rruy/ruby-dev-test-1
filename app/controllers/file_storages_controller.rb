class FileStoragesController < ApplicationController

  def index
    @file_storages = FileStorage.all.order('id DESC')
    @root_folders = Folder.where(parent_id: nil)
  end

  def new
    @file_storage = FileStorage.new
  end

  def create
    @file_storage = FileStorage.create(file_params)
    FileProcessor.new(@file_storage).save

    redirect_to file_storages_path
  end

  def show
    @file_storage = FileStorage.find(params[:id])
    @file = FileProcessor.new(@file_storage).find
  end

  private

  def file_params
    {
      folder_id: params["folder_id"],
      file_name: params["file_to_upload"].try(:original_filename),
      temp_file: params["file_to_upload"].try(:tempfile),
      file_type: FileStorage.file_types["#{params["file_type"]}"]
    }
  end
  
end