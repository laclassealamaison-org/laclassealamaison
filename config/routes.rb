Rails.application.routes.draw do
  resources :classrooms, only: [:index, :show]
  devise_for :users
end
