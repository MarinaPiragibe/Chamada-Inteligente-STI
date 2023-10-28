class Chamada < ApplicationRecord
    belongs_to(
        :professors,
        class_name: 'Professor',
        foreign_key: 'professors_id'
      )
      belongs_to(
        :turmas,
        class_name: 'Turma',
        foreign_key: 'turmas_id'
      )
      belongs_to(
        :alunos,
        class_name: 'Aluno',
        foreign_key: 'alunos_id'
      )
end
