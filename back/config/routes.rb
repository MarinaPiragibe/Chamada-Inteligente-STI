Rails.application.routes.draw do
  #Aluno - API
  root 'alunos#index'
  get "/aluno/:id", to: "alunos#show"
  post "/login", to: "alunos#login"
  post "/atualizarPosicaoAluno", to: "alunos#atualizarPosicao"
  post "/logoutAluno", to: "alunos#logout"


  #Turmas - API
  get "/turmas/aluno/:id", to: "turmas#turmasAluno"
  get "/turmas/professor/:id", to: "turmas#turmasProfessor"
  get "/disciplinas/:id", to: "disciplinas#getDisciplina"


  #chamada - API
  post "/presenca", to: "chamadas#marcarPresenca"
  get "/verificarChamadasAluno/:id", to: "turmas#verificarAulasDiaAluno"
  get "/verificarChamadasProfessor/:id", to: "turmas#verificarAulasDiaProfessor"
  get "/pegarChamadaAtiva/:id", to: "turmas#recuperarChamadaAluno"
  post "/verificarAssinaturaAluno/:id/:turma_id/:dia/:mes/:ano", to:"chamadas#verificarAssinaturaAluno"

  #professor - API
  get "/professor/:id", to: "professors#getProfessor"
  post "/loginProfessor", to: "professors#login"
  post "/atualizarPosicaoProfessor", to: "professors#atualizarPosicao"
  post "/logoutProfessor", to: "professors#logout"

  resources :alunos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
