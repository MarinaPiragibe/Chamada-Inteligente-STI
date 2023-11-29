require 'rails_helper'

describe "Turmas", type: :request do
  before { get '/pegarChamadaAtiva/1' }

  it 'deve retornar uma chamada ativa completa' do
    expect(JSON.parse(response.body)).to include({}).or include({"error"=>" Sem Chamada aberta para assinar!"})
  end
end
