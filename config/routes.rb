Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post 'login', to: 'sessions#login'
      post '/mutant', to: 'dna_analizers#mutant'
      get '/stats', to: 'dna_analizers#stats'
    end
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
