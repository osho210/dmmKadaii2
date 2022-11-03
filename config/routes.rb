Rails.application.routes.draw do
  devise_for :users
  resources :users ,only: [:show,:edit , :create ,:edit , :destroy];
  resources :books ,only: [:new , :index , :show ,:create ,:edit , :destroy];
  get 'homes/about' ,  to: 'homes#about' , as: 'about'
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
