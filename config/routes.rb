Rails.application.routes.draw do
  devise_for :users
  resources :classrooms, only: [:index, :show]
  resources :classroom_animations, only: [:show, :new, :create] do
    resources :closures, only: [:create], controller: 'classroom_animations/closures'
    resources :openings, only: [:create], controller: 'classroom_animations/openings'
  end
  namespace :administration do
    resources :teachers, only: [:index] do
      resources :promotings, only: [:create], controller: 'teachers/promotings'
      resources :demotions, only: [:create], controller: 'teachers/demotions'
    end
  end
end
