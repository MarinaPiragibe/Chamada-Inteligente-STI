require 'rails_helper'

describe "Disciplinas", type: :request do
  before { get '/disciplinas/2' }

  it 'deve recuperar as disciplinas' do
    expect(JSON.parse(response.body)).to include({"cod_disciplina" => "TCC00120", "created_at" => "2023-11-29T16:36:30.463-03:00", "id" => 2, "nome" => "Redes II", "updated_at" => "2023-11-29T16:36:30.463-03:00"})
  end
end


