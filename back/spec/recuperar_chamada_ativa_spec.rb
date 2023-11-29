require 'rails_helper'

describe "Recuperar chamada ativa", type: :request do
  before { get '/pegarChamadaAtiva/1' }

  it 'deve retornar uma chamada ativa completa' do
    expect(JSON.parse(response.body)).to eq({
                                              "id" => 3,
                                              "cod_turma" => "C1",
                                              "hora_inicio" => "09",
                                              "hora_fim" => "11",
                                              "dias" => "[\"terça\", \"quinta\"]",
                                              "aulas_semestre" => 20,
                                              "aulas_com_chamada" => 0,
                                              "chamada_ativa" => 0,
                                              "created_at" => "2023-11-28T22:18:46.720-03:00",
                                              "updated_at" => "2023-11-28T22:18:46.720-03:00",
                                              "professors_id" => 1,
                                              "disciplinas_id" => 2
                                            })
  end
end
