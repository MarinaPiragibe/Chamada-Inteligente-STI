class Turmasgenerator < ActiveRecord::Migration[7.0]
  def change
    Turma.create(id:1, cod_turma: "A1", hora_inicio:Time.new(2023,9,20,14-1,0,0),hora_fim:Time.new(2023,9,20,16-1,0,0),professors_id:1,disciplinas_id:1)
    Turma.create(id:2, cod_turma: "B1", hora_inicio:Time.new(2023,9,20,7-1,0,0),hora_fim:Time.new(2023,9,20,9-1,0,0),professors_id:2,disciplinas_id:1)
    Turma.create(id:3, cod_turma: "C1", hora_inicio:Time.new(2023,9,20,9-1,0,0),hora_fim:Time.new(2023,9,20,11-1,0,0),professors_id:1,disciplinas_id:2)
  end
end
