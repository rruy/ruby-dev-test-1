require 'securerandom'

class FileStorage < ApplicationRecord
  attr_accessor :temp_file
  enum file_type: [:file_local, :file_blob, :file_s3]

  before_save :generate_object_key

  def parse_file_to_bin
    self.data = self.temp_file.read.unpack('b*') if  self.temp_file.present?
    self.save
  end

  private

  def generate_object_key
    self.object_key = "#{SecureRandom.uuid}-#{file_name}"
  end

end
