class AlunosController < ApplicationController
  def index
    @alunos = Aluno.all
  end

  def show
    @aluno=Aluno.find(params[:id])
    @turmas = Turma.joins(aluno_pertence_turmas: :aluno).where("aluno_id = ?",params[:id])
    render json: @aluno
  end

  def login
  
    @aluno = Aluno.where(email:params[:email], senha:params[:senha])
    if(@aluno != [])
      render json: @aluno, :status => :ok
    else
      error = {
        error: "Usuário ou senha inválido!"};
      render :json => error, :status => :bad_request
    end
  end
end
