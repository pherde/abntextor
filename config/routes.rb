Rails.application.routes.draw do
  get 'build/build'

  root "papers#index"
  
  get "/contents/:paper_id/:section_id", to: "contents#edit"
  get 'contents/edit'
  post 'contents/update'
  get "/build/:id", to: "build#build"

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