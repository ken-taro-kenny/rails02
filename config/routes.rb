Rails.application.routes.draw do

  # get 'reservations/index'
  # get 'rooms/index'
  
  #deviseルーティング
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  # get 'users/show'
  # get 'travels/index'
  resources :travels
  resources :rooms
  resources :reservations
  resources :users, :only => [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #アカウント削除確認画面ルーティング
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  
  #予約確認画面ルーティング
  post '/reservations/:id/confirm' => 'reservations#confirm', as: 'confirm'
  
  #rootパス
  root :to => 'travels#index'
  
end
