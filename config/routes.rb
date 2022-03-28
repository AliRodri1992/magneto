Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      post '/mutant', to: 'dna_analizers#mutant'
      get '/stats', to: 'dna_analizers#stats'

      resources :users
      patch 'change_password', to: 'users#change_password'
      post 'login', to: 'sessions#login'
    end
  end
end
