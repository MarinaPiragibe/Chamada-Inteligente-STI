Rails.application.routes.draw do
  resources :turmas
  get "/alunos", to: "alunos#index"

  resources :alunos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
