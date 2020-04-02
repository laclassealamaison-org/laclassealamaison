Rails.application.routes.draw do
  devise_for :users
  resources :classrooms, only: [:index, :show]
  resources :classroom_animations do
    resources :closures, only: [:create], controller: 'classroom_animations/closures'
    resources :openings, only: [:create], controller: 'classroom_animations/openings'
  end
  resources :contacts, only: [:new, :create]
  resources :newsletters, only: [:new, :create]
  resources :questions, only: [:new, :create]
  namespace :administration do
    resources :teachers, only: [:index] do
      resources :promotings, only: [:create], controller: 'teachers/promotings'
      resources :demotions, only: [:create], controller: 'teachers/demotions'
    end
  end
end
