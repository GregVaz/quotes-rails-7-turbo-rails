Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  # root "articles#index"
  resources :quotes

end
