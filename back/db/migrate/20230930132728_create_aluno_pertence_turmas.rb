class CreateAlunoPertenceTurmas < ActiveRecord::Migration[7.0]
  def change
    create_table :aluno_pertence_turmas do |t|
      t.integer :aluno_id, null: false, foreign_key: true
      t.integer :turma_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
