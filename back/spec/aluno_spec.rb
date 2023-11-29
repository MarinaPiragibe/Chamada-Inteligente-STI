require 'rails_helper'

describe "Aluno",  type: :request do
  before { get '/turmas/aluno/1' }
  it 'deve retornar as turmas do aluno' do
    expect(JSON.parse(response.body)).to include(
                                           {"aulas_com_chamada"=>0,
                                            "aulas_semestre"=>20,
                                            "chamada_ativa"=>1,
                                            "cod_turma"=>"A1",
                                            "created_at"=>"2023-11-29T16:36:30.610-03:00",
                                            "dias"=>"[\"segunda\", \"quarta\", \"terça\", \"quinta\", \"sexta\"]",
                                            "disciplinas_id"=>1,
                                            "hora_fim"=>24,
                                            "hora_inicio"=>20,
                                            "id"=>1,
                                            "professors_id"=>1,
                                            "updated_at"=>"2023-11-29T16:36:30.610-03:00"},
                                           {"aulas_com_chamada"=>0,
                                              "aulas_semestre"=>20,
                                              "chamada_ativa"=>0,
                                              "cod_turma"=>"C1",
                                              "created_at"=>"2023-11-29T16:36:30.620-03:00",
                                              "dias"=>"[\"terça\", \"quinta\"]",
                                              "disciplinas_id"=>2,
                                              "hora_fim"=>11,
                                              "hora_inicio"=>9,
                                              "id"=>3,
                                              "professors_id"=>1,
                                              "updated_at"=>"2023-11-29T16:36:30.620-03:00"}
                                         )
  end
end
