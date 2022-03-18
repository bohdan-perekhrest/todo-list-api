Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api do
    namespace :v1 do
      namespace 'auth' do
        post '/sign_up', to: 'registrations#create'
        post '/sign_in', to: 'sessions#create'
        delete '/sign_out', to: 'sessions#destroy'
      end
      resources :projects, except: %i[new edit] do
        resources :tasks, only: %i[index create]
      end
      resources :tasks, only: %i[update destroy show] do
        resources :comments, only: %i[index create]
      end
      patch '/tasks/:id/complete', to: 'tasks#complete'
      patch '/tasks/:id/position', to: 'tasks#position'
      resources :comments, only: %i[destroy]
    end
  end
end
