class AlunosController < ApplicationController

  def show
    @aluno=Aluno.find(params[:id])
    @turmas = Turma.joins(aluno_pertence_turmas: :aluno).where("aluno_id = ?",params[:id])
    render json: @aluno
  end

  def atualizarPosicao
    @aluno = Aluno.find(params[:id])
    @aluno.update(online: params[:online])
    @aluno.update(latitude: params[:latitude])
    @aluno.update(longitude: params[:longitude])
    render json: @aluno, :status => :ok
  end

  #logout aluno
  def logout
    @aluno = Aluno.find(params[:id])
    @aluno.update(online: 0)
    @aluno.update(latitude: 0.0)
    @aluno.update(longitude: 0.0)
    render json: @aluno, :status => :ok
  end

  #Confere o login inserido e retorna Aluno
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
