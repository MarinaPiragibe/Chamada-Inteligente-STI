class CreateTurmas < ActiveRecord::Migration[7.0]
  def change
    create_table :turmas do |t|
      t.string :cod_turma
      t.time :hora_inicio
      t.time :hora_fim

      t.timestamps
    end
  end
end
