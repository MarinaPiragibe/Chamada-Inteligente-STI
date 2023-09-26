class AlunosController < ApplicationController
  def index
    @alunos = Aluno.all
  end

  def show
    @aluno=Aluno.find(params[:id])
  end
end

