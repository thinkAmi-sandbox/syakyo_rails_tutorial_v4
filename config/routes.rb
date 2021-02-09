Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  # 名前付きルート
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # 名前なしルート
  # get 'static_pages/home'
  # get 'static_pages/help'
  # get  'static_pages/about'
  # get  'static_pages/contact'

  # Usersリソースをroutesファイルに追加
  # 名前付きルートおよびRESTfulなUsersリソースで必要なアクションがすべて利用可能になる
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
