class DisciplinasGenerator < ActiveRecord::Migration[7.0]
  def change
    Disciplina.create(id:1,cod_disciplina:"TCC00288", nome:"Banco de dados II")
    Disciplina.create(id:2,cod_disciplina:"TCC00120", nome:"Redes II")
    Disciplina.create(id:3,cod_disciplina:"TCC00234", nome:"Desenvolvimento Web")
  end
end
