class FileBlob < FileBase

  def save
    @file_storage.parse_file_to_bin
  end

  def destroy
    @file_storage.data = nil
    @file_storage.save
  end

  def find
    file = @file_storage.data #.pack('C')
  end

end