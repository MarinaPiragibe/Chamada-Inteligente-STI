class CreateTurmas < ActiveRecord::Migration[7.0]
  def change
    create_table :turmas do |t|
      t.string :cod_turma
      t.string :hora_inicio
      t.string :hora_fim
      t.string :dias, array: true

      t.timestamps
    end
  end
end
