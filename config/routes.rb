Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :recipes
      resources :meals
      post 'signin', to: "users#signin"
      get 'get_recipes', to: "recipes#recipes"
    end
  end
end
