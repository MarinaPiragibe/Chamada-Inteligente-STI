class CreateProfessors < ActiveRecord::Migration[7.0]
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :senha
      t.integer :online #0 offline / 1 online
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
