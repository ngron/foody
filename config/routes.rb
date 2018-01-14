Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  # 登録
  get "signup", to: "users#new"
  resources :users, only: [:show, :create] do
    member do
      get :notice
      get :mylist
    end
  end
  
  # ログイン
  get "login", to: "session#new"
  post "login", to: "session#create"
  delete "logout", to: "session#destroy"
  
  # 投稿
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
end
