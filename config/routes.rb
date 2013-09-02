Rails4Flickrapi::Application.routes.draw do
  root 'photos#search'
  
  resources :photos do
    get 'search', on: :collection
  end
end
