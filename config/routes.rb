Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end
  
  namespace :admins_backoffice do
    get 'welcome/index' # Deshboard
    resources :students
    resources :highlights, only: :index
    resources :admins   # Admins
    resources :subjects # Assuntos
    resources :questions # Perguntas
  end
  devise_for :admins
  
  get 'inicio', to: 'admins_backoffice/admins#index'
  
  root to: 'admins_backoffice/admins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
