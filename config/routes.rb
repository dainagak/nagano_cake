Rails.application.routes.draw do

  #会員側のルート
  devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
  }

  scope module: 'public' do
    root to: 'homes#top'
    get "/home/about" => "homes#about"
    resources :items, only: [:show, :index]
  end

  namespace :public do
    get 'show' => 'publics#show'
    get 'publics/edit' => 'publics#edit'
    patch 'update' => 'publics#update'
    get 'public' => 'publics#unsubscribe'
    patch 'public/withdraw' => 'publics#withdraw', as: 'publics_withdraw'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:create, :new, :index, :show]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  end

  #管理者側のルート
  devise_for :admins, controllers: {
   sessions:      'admin/sessions',
   passwords:     'admin/passwords',
   registrations: 'admin/registrations'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end