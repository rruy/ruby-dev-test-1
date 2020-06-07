# https://aws.amazon.com/blogs/developer/advanced-client-stubbing-in-the-aws-sdk-for-ruby-version-3/
require 'rails_helper'

RSpec.describe FileS3 do
  let(:file_storage)  { build :file_storage, file_type: FileStorage.file_types["file_s3"] }
  let(:fake_s3) { {} }
  let(:client) do
    client = Aws::S3::Client.new(stub_responses: true)
    client.stub_responses(
      :create_bucket, ->(context) {
        name = context.params[:bucket]
        if fake_s3[name]
          'BucketAlreadyExists' # standalone strings are treated as exceptions
        else
          fake_s3[name] = {}
          {}
        end
      }
    )
    client.stub_responses(
      :get_object, ->(context) {
        bucket = context.params[:bucket]
        key = context.params[:key]
        b_contents = fake_s3[bucket]
        if b_contents
          obj = b_contents[key]
          if obj
            { body: obj }
          else
            'NoSuchKey'
          end
        else
          'NoSuchBucket'
        end
      }
    )
    client.stub_responses(
      :put_object, ->(context) {
        bucket = context.params[:bucket]
        key = context.params[:key]
        body = context.params[:body]
        b_contents = fake_s3[bucket]
        if b_contents
          b_contents[key] = body
          {}
        else
          'NoSuchBucket'
        end
      }
    )
    client.stub_responses(
      :get, ->(context) {
        response_target = ""
      }
    )
    client
  end

  before do
    client.create_bucket(bucket: "test")
  end

  context 'save' do
    it 'valid' do
      result = FileS3.new(file_storage).save
      expect(result.empty?).to eq false
    end
  end

  context 'destroy' do
    it 'valid' do
      result = FileS3.new(file_storage).destroy
      expect(result.empty?).to eq true
    end
  end

  context "bucket operations" do
    it "can write and retrieve an object" do
      client.put_object(bucket: "test", key: "obj", body: "Hello!")
      obj = client.get_object(bucket: "test", key: "obj")
      expect(obj.body.read).to eq("Hello!")
      expect(client.api_requests.size).to eq(3)
      expect(client.api_requests.last[:params]).to eq(
        bucket: "test",
        key: "obj"
      )
    end

    it "raises the appropriate exception when a bucket doesn't exist" do
      expect {
        client.put_object(
          bucket: "sirnotappearinginthistest",
          key: "knight_sayings",
          body: "Ni!"
        )
      }.to raise_error(Aws::S3::Errors::NoSuchBucket)
      expect(client.api_requests.size).to eq(2)
    end

    it "raises the appropriate exception when an object doesn't exist" do
      expect {
        client.get_object(bucket: "test", key: "404NoSuchKey")
      }.to raise_error(Aws::S3::Errors::NoSuchKey)
      expect(client.api_requests.size).to eq(2)
    end
  end

end