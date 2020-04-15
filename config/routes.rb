Rails.application.routes.draw do

  root 'welcome#home'

  ############## chef routes ##############
  get "signup", to: "chefs#new", as: "signup"
  get '/chefs/login', to: 'chefs#login', as: 'chef_login'
  post '/chefs/login', to: 'chefs#handle_login'
  post '/logout', to: 'chefs#logout', as: 'logout'

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

  get '/cooking_entries/new', to: 'cooking_entries#new', as: 'new_entry'
  post '/cooking_entries', to: 'cooking_entries#create'
  get '/cooking_entries/:id', to: 'cooking_entries#show', as: 'cooking_entry'
  get '/cooking_entries/:id/edit', to: 'cooking_entries#edit', as: 'edit_cooking_entry'
  patch '/cooking_entries/:id', to: 'cooking_entries#update'
  delete '/cooking_entries/:id', to: 'cooking_entries#delete', as: 'delete_entry'
end