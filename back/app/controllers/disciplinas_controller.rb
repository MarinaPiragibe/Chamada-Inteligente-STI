class DisciplinasController < ApplicationController
  before_action :set_disciplina, only: %i[ show edit update destroy ]

  # GET /disciplinas or /disciplinas.json
  def index
    @disciplinas = Disciplina.all
  end

  # GET /disciplinas/1 or /disciplinas/1.json

  def getDisciplina
    @disciplina = Disciplina.where(id:params[:id])
    if(@disciplina != [])
    render json: @disciplina, :status => :ok
    else
      error = {
        error: "Erro na recuperação da disciplina!"};
      render :json => error, :status => :bad_request
    end
  end
  
end
