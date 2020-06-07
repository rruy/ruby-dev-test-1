require 'fileutils'

class FileLocal < FileBase
  
  def save
    FileUtils.mv(@file_storage.temp_file, "./public/uploads/#{@file_storage.object_key}")
  end

  def destroy
    raise "File not found!" unless File.exist?(file_path)
    File.delete(file_path) 
  end

  def find
    "/uploads/#{@file_storage.object_key}"
  end

  private 

  def file_path
    File.join Rails.root, "public/uploads/#{@file_storage.object_key}"
  end

end