class CreateTurmas < ActiveRecord::Migration[7.0]
  def change
    create_table :turmas do |t|
      t.string :cod_turma
      t.integer :hora_inicio
      t.integer :hora_fim
      t.string :dias, array: true
      t.integer :aulas_semestre
      t.integer :aulas_com_chamada
      t.integer :chamada_ativa #0 chamada inativa // 1 chamada ativa - pode assinar
      t.timestamps
    end
  end
end
