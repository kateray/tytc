Tytc::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :links
  resources :votes
  
  get '/:language', to: 'languages#show', as: 'language'

  root to: "links#index"
end
