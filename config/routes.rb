Rails.application.routes.draw do
  #get 'user/show'
  get '/user/:id', to: 'user#show', as: 'user'



  root 'posts#index'
  # devise_for :userss
  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true
  end

end
