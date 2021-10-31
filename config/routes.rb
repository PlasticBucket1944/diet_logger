Rails.application.routes.draw do
  root 'comments#index' # デバッグ用
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
