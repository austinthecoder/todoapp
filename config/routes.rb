Todoapp::Application.routes.draw do

  root :to => 'todos#index'

  resources :todos, :only => %w[create]

end
