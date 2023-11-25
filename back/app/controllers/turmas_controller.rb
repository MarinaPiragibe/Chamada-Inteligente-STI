class TurmasController < ApplicationController


  # GET /turmas/1 or /turmas/1.json
  #Recupera turma com o professor e disciplina
  def show
    @turma = Turma.find(params[:id])
    @professor = Professor.where("id = ?",@turma.professors_id)
    @disciplina = Disciplina.where("id = ?",@turma.disciplinas_id)

    
  end

  #Recupera turmas do aluno
  def turmasAluno
    @turmas = Turma.joins(aluno_pertence_turmas: :aluno).where("aluno_id = ?",params[:id])
    lista_turmas = []
    for i in @turmas do
      lista_turmas.push(i)
    end
    if(lista_turmas != [])
    render json: lista_turmas, :status => :ok
    else
      error = {
        error: "Sem turma inscritas!"};
      render :json => error, :status => :bad_request
    end
  end


  def turmasProfessor
    @turmas = Turma.where("professors_id = ?",params[:id])
    lista_turmas = []
    for i in @turmas do
      lista_turmas.push(i)
    end
    if(lista_turmas != [])
    render json: lista_turmas, :status => :ok
    else
      error = {
        error: " Sem turma para ministrar!"};
      render :json => error, :status => :bad_request
    end
  end


end
