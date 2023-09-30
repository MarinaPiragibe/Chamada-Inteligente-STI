class AdicionandoFkTurma < ActiveRecord::Migration[7.0]
  def change
    add_reference :turmas, :professors, foreign_key: true
    add_reference :turmas, :disciplinas, foreign_key: true
  end
end
