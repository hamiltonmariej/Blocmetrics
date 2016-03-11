Rails.application.routes.draw do
  devise_for :users
  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    controller :events, path: '/events' do
      match 'post_action', via: [:get, :post, :options]
    end
  end
  #   resources :events, only: [:create, :options]
  # end
  #
  # match '/events', to: 'events#preflight', via: [:options]
  #   resources :events, only: [:post, :create]

  get 'about' => 'welcome#about'
  get 'welcome/index'

  root 'welcome#index'
end
