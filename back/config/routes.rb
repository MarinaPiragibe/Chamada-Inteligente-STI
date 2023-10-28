Rails.application.routes.draw do
  root 'alunos#index'
  get "/disciplinas/:id", to: "disciplinas#getDisciplina"
  get "/professors/:id", to: "professors#getProfessor"
  get "/turmas/:id", to: "turmas#home"
  get "/alunos", to: "alunos#index"
  post "/login", to: "alunos#login"
  post "/presenca", to: "chamadas#marcarPresenca"
  get "/presencas", to: "chamadas#show"

  resources :alunos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
