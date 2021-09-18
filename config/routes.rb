Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
    root 'homes#top'
    get '/about' => 'homes#about'
    get '/search' => 'searches#search'
    get '/recipes/favorite' => 'recipes#favorite'
    resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]


    # get 'unsubscribe' => "users#unsubscribe"
    # patch ':id/withdraw' => 'users#withdraw'

    get 'unsubscribe/' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch ':id/withdraw/' => 'users#withdraw', as: 'withdraw_user'
    put 'withdraw/' => 'users#withdraw'
  end
end
