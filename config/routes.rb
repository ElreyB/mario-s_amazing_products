Rails.application.routes.draw do
  root :to => 'product#index'

  resources :products do
    resources :reviews
  end
  
end
