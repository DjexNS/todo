RailsDevisePundit::Application.routes.draw do
  
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :tasks

  post 'users/:id/assign' => 'users#assign', as: :assign_tasks
  post 'tasks/:id/shuffle' => 'tasks#shuffle', as: :shuffle_tasks

end