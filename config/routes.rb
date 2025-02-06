Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  if Rails.env.development?
    # sidekiq
    require "sidekiq/web"
    mount Sidekiq::Web => "/sidekiq"

    # letter_opener_web
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
