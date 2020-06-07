require 'rails_helper'

RSpec.describe FileLocal do

  CODE_DELETED_SUCCESS = 1
  CODE_SAVE_SUCCESS = 0

  let(:file_storage)  { build :file_storage }

  context 'save' do
    it 'valid test' do
      expect(FileLocal.new(file_storage).save).to eq CODE_SAVE_SUCCESS
    end

    it 'invalid test' do
      file_storage.temp_file = nil
      expect { FileLocal.new(file_storage).save }.to raise_error
    end
  end

  context 'find' do
    let(:expected_path) { "/uploads/#{file_storage.object_key}" }

    it 'valid test' do
      expect(FileLocal.new(file_storage).find).to include(expected_path)
    end

    it 'invalid test' do
      file_storage.object_key = nil
      expect(FileLocal.new(file_storage).find).not_to include('.jpg')
    end
  end

  context 'destroy' do
    it 'valid test' do
      expect(FileLocal.new(file_storage).destroy).to eq CODE_DELETED_SUCCESS
    end

    it 'invalid test' do
      file_storage.object_key = nil
      expect { FileLocal.new(file_storage).destroy }.to raise_error
    end
  end

end