Rails.application.routes.draw do
  root "papers#index"
  
  get "/contents/:paper_id/:section_id", to: "contents#edit"
  get 'contents/edit'
  post 'contents/update'
  get "/build/:id", to: "contents#build"

  resources :fields
  resources :sections
  resources :papers
  resources :templates
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end