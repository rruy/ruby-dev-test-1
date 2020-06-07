require 'aws-sdk'

class FileS3 < FileBase

  def save
    object = @bucket.object("#{@file_storage.object_key}")
    object.put(body: File.open(@file_storage.temp_file))
  end

  def destroy
    object = @s3.bucket(ENV['S3_BUCKET']).object("#{@file_storage.object_key}")
    object.delete
  end

  def find
    byebug
    path_to_download = File.join(Rails.root, "public/uploads/#{@file_storage.object_key}")
    object = @s3.bucket(ENV['S3_BUCKET']).object("#{@file_storage.object_key}")
    object.get(response_target: path_to_download)
    file = "/uploads/#{@file_storage.object_key}"
  end

  private

  def set_provider
    client = Aws::S3::Client.new(region: ENV['S3_REGION'])
    @s3 = Aws::S3::Resource.new(client: client)
    @bucket = @s3.bucket(ENV['S3_BUCKET'])
  end
end