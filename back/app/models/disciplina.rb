class Disciplina < ApplicationRecord
    has_many(
        :turmas,
        class_name: 'Turma',
        foreign_key: 'disciplinas_id',
        dependent: :destroy
      )
end
