Rails.application.routes.draw do
  #Aluno - API
  root 'alunos#index'
  get "/alunos", to: "alunos#index"
  post "/login", to: "alunos#login"


  #Turmas - API
  get "/turmas/aluno/:id", to: "turmas#turmasAluno"
  get "/turmas/professor/:id", to: "turmas#turmasProfessor"
  get "/disciplinas/:id", to: "disciplinas#getDisciplina"


  #chamada - API
  post "/presenca", to: "chamadas#marcarPresenca"
  get "/verificarChamadasAluno/:id", to: "chamadas#verificarChamadasAluno"

  #professor - API
  get "/professor/:id", to: "professors#getProfessor"
  post "/loginProfessor", to: "professors#login"

  resources :alunos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
