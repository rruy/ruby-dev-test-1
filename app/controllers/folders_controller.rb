class FoldersController < ApplicationController

  def new
    @folder = Folder.new
  end

  def create
    Folder.create(folder_params)

    redirect_to file_storages_path
  end

  private

  def folder_params
    params.require(:folder).permit(:parent_id, :name)
  end

end
