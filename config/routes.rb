Rails.application.routes.draw do
  devise_for :users
  resources :classrooms, only: [:index, :show]
  resources :classroom_animations, only: [:show, :new, :create] do
    resources :closures, only: [:create], controller: 'classroom_animations/closures'
    resources :openings, only: [:create], controller: 'classroom_animations/openings'
  end
end
