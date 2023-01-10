Rails.application.routes.draw do
  namespace :public do
    get 'bookmarks/index'
  end
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
    get 'home/top'
  end
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :cosme_items, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
      resources :cosme_comments, only: [:create, :destroy]
    end
  end
  
end
