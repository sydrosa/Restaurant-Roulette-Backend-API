Rails.application.routes.draw do
  scope '/api' do
    # mount Knock::Engine => "/knock"
    post 'user_token' => 'user_token#create'
    resources :users
    resources :cuisine_preferences
  end
  resources :matches, only: [:index, :show]
  # resources :cuisine_preferences
  resources :cuisines, only: [:index, :show]
  # resources :users, only: [:create, :show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
