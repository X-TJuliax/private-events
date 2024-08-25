Rails.application.routes.draw do

  resources :events, only: [:index, :create, :edit, :update] do
    member do
      post 'attend_event'
      delete 'unattend_event'
      delete 'delete_event'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'events#index'
  # get 'new_event', to: 'events#index', as: 'new_event'
  post 'new_event', to: 'events#create', as: 'create_new_event'
end
