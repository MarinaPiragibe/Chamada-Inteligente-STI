class ProfessorsController < ApplicationController
  before_action :set_professor, only: %i[ show edit update destroy ]

  #Recupera o PROFESSOR com ID
  def getProfessor
    @professor = Professor.where(id:params[:id])
    if(@professor != [])
    render json: @professor, :status => :ok
    else
      error = {
        error: "Erro na recuperação do professor!"};
      render :json => error, :status => :bad_request
    end
  end
  def atualizarPosicao
    @professor = Professor.find(params[:id])
    @professor.update(online: 1)
    @professor.update(latitude: params[:latitude])
    @professor.update(longitude: params[:longitude])
    render json: @professor, :status => :ok
  end

  def logout
    @professor = Professor.find(params[:id])
    @professor.update(online: 0)
    #@aluno.update(latitude: 0)
    #@aluno.update(longitude: 0)
    render json: @professor, :status => :ok
  end

  #Retorna o login do professor
  def login
  
    @professor = Professor.where(email:params[:email], senha:params[:senha])
    if(@professor != [])
      render json: @professor, :status => :ok
    else
      error = {
        error: "Usuário ou senha inválido!"};
      render :json => error, :status => :bad_request
    end
  end
end
