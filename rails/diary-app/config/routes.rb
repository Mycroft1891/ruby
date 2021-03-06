Rails.application.routes.draw do
  root                'static_site#home'
  post "/graphql", to: "graphql#execute"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :entries
  resources :photos
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
