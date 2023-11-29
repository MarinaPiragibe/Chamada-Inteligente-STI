class AlunosGenerator < ActiveRecord::Migration[7.0]
  def change
    Aluno.create(id:1, nome: "Pedro Ximenes", cpf: 16772097718, email:"pedrobose@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
    Aluno.create(id:2, nome: "Marina Piragibe", cpf: 93994355044, email:"MarinaPiragibe@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
    Aluno.create(id:3, nome: "Pietro Lancastre", cpf: 33923760000, email:"Pietrolancastre@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
    Aluno.create(id:4, nome: "Israel", cpf: 49299328072, email:"Israel@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
    Aluno.create(id:5, nome: "Gabriel Vieira", cpf: 79398006049, email:"gabrielVieira@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
    Aluno.create(id:6, nome: "Gabriel Mills", cpf: 17943733061, email:"Gabrielmilss@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
    Aluno.create(id:7, nome: "Silvana Bose", cpf: 33128689040, email:"Silvanabose@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
    Aluno.create(id:8, nome: "Vinicius Moraes", cpf: 40388151021, email:"Viniciusmoraes@id.uff.br", senha:"#pedro123", online:0,latitude:0,longitude:0)
  end
end
