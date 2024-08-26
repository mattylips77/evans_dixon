Rails.application.routes.draw do
  resources :client_data_entries do
    member do
      get 'sub_form', to: "client_data_entries#sub_form"
    end
  end
  resources :client_legal_forms do
    collection do
      get :download_csv
    end
    member do
      get '/new_for_client/', to: "client_legal_forms#new_for_client"
    end
    member do
      get '/forms_by_client/', to: "client_legal_forms#forms_by_client"
    end
  end
  get '/subForm/:id', to: 'client_data_entries#subForm'
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
