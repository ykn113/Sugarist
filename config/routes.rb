Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get '/about' =>'homes#about'
  get 'recipe_search' =>'homes#recipe_search'
  get '/search' => 'searches#search'
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]

end
