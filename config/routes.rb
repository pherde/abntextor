Rails.application.routes.draw do
  devise_for :users
  root "papers#index"
  
  get 'build/build'

  # User routes
  match "/trabalhos/(:page)", to: "papers#index", via: [:get]
  get "/trabalhos", to: "papers#index"
  get "/trabalho/:hash_name", to: "papers#edit"
  delete "/trabalho/:hash_name", to: "papers#destroy"
  get "/trabalho/:hash_name/:section_id", to: "contents#edit"
  get "/pdf/:hash_name", to: "build#build"
  get "/perfil", to: "users#profile"

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

  # Pagination routes
  #match "/templates/(:page)", to: "templates#index", via: [:get]
  #match "/sections/(:page)", to: "sections#index", via: [:get]
  #match "/fields/(:page)", to: "fields#index", via: [:get]
  #match "/users/(:page)", to: "users#index", via: [:get]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end