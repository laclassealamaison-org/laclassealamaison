Rails.application.routes.draw do
  resources :classrooms, only: [:index, :show]
  resources :sessions, only: [:show, :new, :create] do
    resources :closures, only: [:create], controller: 'sessions/closures'
    resources :openings, only: [:create], controller: 'sessions/openings'
  end
  devise_for :users
end
