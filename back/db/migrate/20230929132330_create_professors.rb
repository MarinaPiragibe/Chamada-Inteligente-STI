class CreateProfessors < ActiveRecord::Migration[7.0]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :cpf

      t.timestamps
    end
  end
end
