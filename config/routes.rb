Rails.application.routes.draw do
  resources :client_data_entries
  resources :client_legal_forms do
    collection do
      get :download_csv
    end
  end
  get '/myForm/:id', to: 'client_legal_forms#userEdit'
  get '/hashError', to: 'home#bad_hash'
  get '/clientSuccess', to: 'home#client_success'
  get '/downloadCsv/:id', to: 'client_answers#download_csv'
  resources :clients
  resources :legal_form_questions
  resources :legal_forms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
