Rails.application.routes.draw do
  resources :disciplinas
  resources :professors
  resources :turmas
  get "/alunos", to: "alunos#index"

  get "/alunos/:id/details", to: "alunos#details"

  resources :alunos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
