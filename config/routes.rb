Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'questions#index'
  resources :questions do
    get :new_comment
  end
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
