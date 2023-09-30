class Professor < ApplicationRecord
    has_many(
        :turmas,
        class_name: 'Turma',
        foreign_key: 'professors_id',
        dependent: :destroy
      )
end
