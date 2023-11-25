class Turmasgenerator < ActiveRecord::Migration[7.0]
  def change
    Turma.create(id:1, cod_turma: "A1", hora_inicio:"14",hora_fim:"16",professors_id:1,disciplinas_id:1,dias:["segunda","quarta"],aulas_semestre: 20, aulas_com_chamada: 0)
    Turma.create(id:2, cod_turma: "B1", hora_inicio:"07",hora_fim:"09",professors_id:2,disciplinas_id:1,dias:["segunda","quarta"],aulas_semestre: 20, aulas_com_chamada: 0)
    Turma.create(id:3, cod_turma: "C1", hora_inicio:"09",hora_fim:"11",professors_id:1,disciplinas_id:2,dias:["terça","quinta"],aulas_semestre: 20, aulas_com_chamada: 0)
  end
end
