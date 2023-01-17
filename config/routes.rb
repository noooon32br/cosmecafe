Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :cosme_categorys, only: [:index, :edit, :create, :update]
    get 'homes/top'
  end
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :index, :update, :destroy] do
      resources :bookmarks, only: [:index]
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :cosme_items, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
      resources :cosme_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    get "search" => "searches#search"
    get '/cosme_item/hashtag/:name' => 'cosme_items#hashtag'
    # get '/cosme_item/hashtag' => 'cosme_items#hashtag'
  end
  
end
