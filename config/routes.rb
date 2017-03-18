Rails.application.routes.draw do

  devise_for :users

  root "home#index"
  get "/about"       => "home#about", as: :about

  resources :jobs do
    resources :applies, only: [:create, :destroy]
  end

  resources :profiles

  resources :applies, only: [:show]

  get "/user/:id/user_jobs"  => "users#user_jobs", as: :user_jobs

end
