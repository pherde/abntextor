Rails.application.routes.draw do
  root "papers#index"
  
  get 'build/build'

  # User routes
  get "/trabalho/:hash_name", to: "papers#edit"
  delete "/trabalho/:hash_name", to: "papers#destroy"
  get "/trabalho/:hash_name/:section_id", to: "contents#edit"
  get "/pdf/:hash_name", to: "build#build"

  # Contents path
  get 'contents/edit'
  post 'contents/update'

  resources :papers
  resources :templates do
    resources :sections
  end
  resources :sections do
    resources :fields
  end
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end