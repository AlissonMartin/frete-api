Rails.application.routes.draw do
    post '/user/signin', to: "authentication#signin"
    post '/user/signup', to: "authentication#signup"

    get "/user", to: "user#show"
    put "/user", to: "user#update"

    resources :appointment, only: [:create, :update, :show, :destroy]
    get "/appointment/list", to: "appointment#list"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
