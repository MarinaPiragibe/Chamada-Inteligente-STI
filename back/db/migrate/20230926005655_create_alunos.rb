class CreateAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.integer :cpf

      t.timestamps
    end
  end
end
