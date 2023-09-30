class ProfessorGenerator < ActiveRecord::Migration[7.0]
  def change
      Professor.create(id:1,nome:"Carlos Ribeiro",cpf: 50775685020)
      Professor.create(id:2,nome:"Debora",cpf: 89419228010)
      Professor.create(id:3,nome:"Esteban",cpf: 95487100055)
      Professor.create(id:4,nome:"André risadinha",cpf: 10478098006)
  end
end
