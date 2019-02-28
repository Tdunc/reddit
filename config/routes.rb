Rails.application.routes.draw do
  root 'subs#index'

  resources :subs
  # put '/subs/:id', to: 'subs#update'
end
