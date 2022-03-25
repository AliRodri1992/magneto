Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/mutant', to: 'dna_analizers#mutant'
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
