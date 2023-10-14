Rails.application.routes.draw do
  devise_for :users
  get 'rooms/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'recruits/top' => 'recruits#top'
  get 'recruits/about'=> 'recruits#about'
  resources :users, only: [:show, :index] 
  resources :recruits
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  root 'recruits#top'
end
