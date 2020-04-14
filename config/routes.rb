Rails.application.routes.draw do

  ############## chef routes ##############
  get "signup", to: "chefs#new", as: "signup"
  get '/chefs/login', to: 'chefs#login', as: 'chef_login'
  post '/chefs/login', to: 'chefs#handle_login'
  post '/logout', to: 'chefs#logout'

  post '/chefs/', to: 'chefs#create'
  get '/chefs/:id', to: 'chefs#show', as: 'chef'
  get '/chefs/:id/edit', to: 'chefs#edit', as: 'edit_chef'
  patch '/chefs/:id', to: 'chefs#update'
  delete 'chefs/:id', to: "chefs#destroy"

  ############## recipe routes ##############

  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  post '/recipes', to: 'recipes#create'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  patch '/recipes/:id', to: 'recipes#update'
  delete '/recipes/:id', to: 'recipes#destroy'

  ############## cooking entry routes ##############

  # get '/recipes', to: 'recipes#index', as: 'recipes'
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  # post '/recipes', to: 'recipes#create'
  get '/cooking_entries/:id', to: 'cooking_entries#show', as: 'cooking_entry'
  # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  # patch '/recipes/:id', to: 'recipes#update'
  # delete '/recipes/:id', to: 'recipes#destroy'
end