Tytc::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # resources :links
  resources :votes

  # TODO: cleanup routes

  # resources :languages do
  #   resources :links
  # end
  get ':language', to: 'languages#show', as: 'language'
  #
  scope ':language', as: 'language' do
    resources :links
  end

  root to: "root#home"
end
