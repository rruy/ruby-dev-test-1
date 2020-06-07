require 'rails_helper'
RSpec.describe FileStoragesController, type: :controller do
  let(:file_storage){ create :file_storage }
  let(:file) { double 'FileProcessor', :find => nil }

  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_succes
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  context 'POST #create' do 
    it 'returns a success response' do
      post :create, params: { folder_id: nil,
        file_type: "file_local",
        file_to_upload: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/teste.jpg"))
      }
      expect(response.status).to eq(302)
    end

    it 're  turns a invalid response' do
      params = { folder_id: nil,
        file_type: "file_local",
        file_to_upload: nil
      }
      expect{ post :create, params: params }.to raise_error("File not found!")
    end
  end

  context 'GET #show' do
    it "assigns the requested listing as @listing" do
      stub_const 'FileProcessor', double(:new => file)
      get :show, {id: file_storage.to_param}
      
      expect(assigns(:file_storage)).to eq(file_storage)
    end
  end

end