Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
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
end
