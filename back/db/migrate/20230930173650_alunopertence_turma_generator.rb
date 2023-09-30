class AlunopertenceTurmaGenerator < ActiveRecord::Migration[7.0]
  def change
    AlunoPertenceTurma.create(id:1,aluno_id:1,turma_id:1)
    AlunoPertenceTurma.create(id:2,aluno_id:1,turma_id:2)
    AlunoPertenceTurma.create(id:3,aluno_id:2,turma_id:1)
    AlunoPertenceTurma.create(id:4,aluno_id:3,turma_id:2)
  end
end
