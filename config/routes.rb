Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'racing_sessions#index'

  resources :racing_sessions, :only => [:index] do
    resources :laps, :only => [:index]
  end

  resources :tracks, :only => [:index, :show]
end
