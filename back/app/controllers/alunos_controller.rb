class AlunosController < ApplicationController
  def index
    @alunos = Aluno.all
  end

  def show
    @aluno=Aluno.find(params[:id])
    @turmas = Turma.joins(aluno_pertence_turmas: :aluno).where("aluno_id = ?",params[:id])
  end

  def details
    @aluno = Aluno.find(params[:id])
  end
end

