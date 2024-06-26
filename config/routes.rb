Rails.application.routes.draw do
  get "errors/not_found"
  get "errors/internal_server_error"
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions"} do
    delete "sign_out", to: "users/sessions#destroy", as: :destroy_user_session
  end

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  scope controller: :static_pages do
    get :about
    get :contact
    get :docs
    get :index
    get :privacy
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#index"
  resources "feedbacks", only: [:create]
  resources :screenshots

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
