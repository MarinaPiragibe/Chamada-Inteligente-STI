require 'rails_helper'

describe "Professor", type: :request do
  before { get '/professor/1' }

  it 'deve retornar as turmas de um professor' do
    expect(JSON.parse(response.body)).to include({"cpf"=>"50775685020",
                                                  "created_at"=>"2023-11-29T16:36:29.963-03:00",
                                                  "email"=>"carlos@gmail.com",
                                                  "id"=>1,
                                                  "latitude"=>0.0,
                                                  "longitude"=>0.0,
                                                  "nome"=>"Carlos Ribeiro",
                                                  "online"=>0,
                                                  "senha"=>"123",
                                                  "updated_at"=>"2023-11-29T16:36:29.963-03:00"})
  end
end
