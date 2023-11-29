class ProfessorGenerator < ActiveRecord::Migration[7.0]
  def change
      Professor.create(id:1,nome:"Carlos Ribeiro",cpf: 50775685020, email:"carlos@gmail.com", senha:"123", online:0,latitude:0,longitude:0)
      Professor.create(id:2,nome:"Debora",cpf: 89419228010, email:"debora@gmail.com", senha:"123", online:0,latitude:0,longitude:0)
      Professor.create(id:3,nome:"Esteban",cpf: 95487100055, email:"esteban@gmail.com", senha:"123", online:0,latitude:0,longitude:0)
      Professor.create(id:4,nome:"André Souza",cpf: 10478098006, email:"andre@gmail.com", senha:"123", online:0,latitude:0,longitude:0)
  end
end
