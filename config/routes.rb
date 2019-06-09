Rails.application.routes.draw do

  root to: 'articles#index'

  resources :articles, only: [:index, :show] do
    resources :picks, only: [:create, :destroy]
  end

  post   '/:pick_id/like' => 'likes#create',   as: 'like'
  delete '/:pick_id/unlike' => 'likes#destroy', as: 'unlike'

  resources :users, only: [:show, :destroy]

  get '/settings', to: 'users#edit'
  patch '/settings', to: 'users#update'

  # SNSログアウト
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # SNSログアウト
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
end
