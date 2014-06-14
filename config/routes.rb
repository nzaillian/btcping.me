Rails.application.routes.draw do
  root to: "home#home"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }  

  resources :users
  resources :price_notifications
end
