Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :file_storages
  resources :folders

  root :to => "file_storages#index"
end
