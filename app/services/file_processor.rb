class FileProcessor
  attr_accessor :file_storage

  def initialize(file_storage)
    @file_storage = file_storage
  end

  def save
    valid?
    file_processor_specialized.save
  end

  def find
    file_processor_specialized.find
  end

  private

  def file_processor_specialized
    file_storage.file_type.camelize.constantize.new(file_storage)
  end

  def valid?
    raise "File not found!" if file_storage.temp_file.blank?
    raise "File Key not defined!" if file_storage.object_key.blank?
  end

end