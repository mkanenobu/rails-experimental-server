Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # for graphiql
  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/hello", to: "hello#index"

  resources :users
  post "/login", to: "login#login"
end
