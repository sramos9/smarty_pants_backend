Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    resources :posts do
      resources :comments
    end
      collection do
        post '/login', to: 'users#login'
      end
  end
  resources :posts do
    # resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
