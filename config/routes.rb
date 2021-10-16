Rails.application.routes.draw do
  devise_for :publics

  namespace :public do
    root to: 'homes#top'
    get "/home/about" => "homes#about"
  end

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
  end

  devise_for :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
