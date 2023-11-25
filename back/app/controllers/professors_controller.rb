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
