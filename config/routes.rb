Rails.application.routes.draw do
  devise_for :users
  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create, :options]
  end

  match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]

  get 'about' => 'welcome#about'
  get 'welcome/index'

  root 'welcome#index'
end
