Rails.application.routes.draw do
  resources :urls
  get 'urls/:id', to: 'urls#show_full'
  root 'urls#index'


end
