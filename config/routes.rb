Tytc::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :links
  resources :votes

  get '/:language', to: 'languages#show', as: 'language'

  root to: "links#index"
end
