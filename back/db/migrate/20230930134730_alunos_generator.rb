class AlunosGenerator < ActiveRecord::Migration[7.0]
  def change
    Aluno.create(id:1, nome: "Pedro Ximenes", cpf: 16772097718)
    Aluno.create(id:2, nome: "Marina Piragibe", cpf: 93994355044)
    Aluno.create(id:3, nome: "Pietro Lancastre", cpf: 33923760000)
    Aluno.create(id:4, nome: "Israel", cpf: 49299328072)
    Aluno.create(id:5, nome: "Gabriel Vieira", cpf: 79398006049)
    Aluno.create(id:6, nome: "Gabriel Mills", cpf: 17943733061)
    Aluno.create(id:7, nome: "Valterror", cpf: 33128689040)
    Aluno.create(id:8, nome: "Vinicius Moraes", cpf: 40388151021)
  end
end
