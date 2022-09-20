Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
end
