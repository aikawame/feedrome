Rails.application.routes.draw do
  root 'homes#index'

  resources :homes, only: %i[index]

  get  'login',  to: 'authentications#login'
  post 'login',  to: 'authentications#verify', as: 'verify'
  get  'logout', to: 'authentications#logout'

  resources :users, except: %i[index], param: :firebase_uid do
  end
end
