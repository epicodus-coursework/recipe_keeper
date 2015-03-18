Rails.application.routes.draw do
  root :to => 'users#index'

  resources :users do
    resources :recipes
  end

  resources :sessions, :only => [:new, :create, :destroy]

end
