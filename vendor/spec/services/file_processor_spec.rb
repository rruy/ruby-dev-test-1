require 'rails_helper'

RSpec.describe FileProcessor do
  CODE_SUCCESS = 0
  let(:file_storage)  { build :file_storage }

  before { allow(file_storage).to receive(:save).and_return(true) }

  it 'valid test' do
    expect(FileProcessor.new(file_storage).save).to eq CODE_SUCCESS
  end

  it 'invalid test when temp file not present' do
    file_storage.temp_file = nil
    expect { FileProcessor.new(file_storage).save }.to raise_error("File not found!")
  end

  it 'invalid test when object key not present' do
    file_storage.object_key = nil
    expect { FileProcessor.new(file_storage).save }.to raise_error("File Key not defined!")
  end
end