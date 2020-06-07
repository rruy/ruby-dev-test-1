 require 'tempfile'
 
 FactoryBot.define do
   factory :file_storage do
     file_name { 'teste.jpg' }
     file_path { '../support/teste.jpg' }
     temp_file { Tempfile.new(['test', '.jpg'], File.join(Rails.root, "spec/fixtures/")) }
     object_key { '1_teste.jpg' }
     file_type { FileStorage.file_types["file_local"] }
   end
 end