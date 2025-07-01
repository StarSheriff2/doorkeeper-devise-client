Rails.application.routes.draw do
  get 'explore/:api' => 'api#explore', as: :explore_api

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'home#index'
end
