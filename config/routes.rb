Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Website

  resources :contacts, only: %i[new create]
  resources :newsletters, only: %i[new create]
  resources :questions, only: %i[new create]
  resources :progress_cards, only: %i[new create]


  # Application

  resources :classrooms, only: %i[index show]
  resources :classroom_animations do
    resources :closures, only: [:create], controller: 'classroom_animations/closures'
    resources :openings, only: [:create], controller: 'classroom_animations/openings'
  end

  resources :courses

  resources :children
  namespace :parent do
    resources :classroom_animation_reservations
  end

  namespace :teachers do
    resources :courses
  end

  namespace :administration do
    resources :menus, only: [:index]
    resources :courses
    resources :responsible_parents, only: %i[index edit update] do
      resources :promotings, only: [:create], controller: 'responsible_parents/promotings'
      resources :demotions, only: [:create], controller: 'responsible_parents/demotions'
    end
    resources :teachers, only: %i[index edit update] do
      resources :promotings, only: [:create], controller: 'teachers/promotings'
      resources :demotions, only: [:create], controller: 'teachers/demotions'
    end
    resources :users, only: %i[index edit update] do
      patch :impersonate, on: :collection
    end
  end
end
