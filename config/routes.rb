Rails.application.routes.draw do




  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :statuses, only: [:new, :create, :edit, :update, :destroy]

  get 'likes/create'

  get 'likes/destroy'

end
