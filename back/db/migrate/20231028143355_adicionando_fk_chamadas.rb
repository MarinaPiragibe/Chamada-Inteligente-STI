class AdicionandoFkChamadas < ActiveRecord::Migration[7.0]
  def change
    add_reference :chamadas, :professors, null:false, foreign_key: true
    add_reference :chamadas, :turmas,null:false, foreign_key: true
    add_reference :chamadas, :alunos, null:false, foreign_key:true
  end
end
