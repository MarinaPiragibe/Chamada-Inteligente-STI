class Turma < ApplicationRecord
    has_many :aluno_pertence_turmas, dependent: :destroy
    has_many :alunos, through: :aluno_pertence_turmas

    belongs_to(
        :professors,
        class_name: 'Professor',
        foreign_key: 'professors_id'
      )

      belongs_to(
        :disciplinas,
        class_name: 'Disciplina',
        foreign_key: 'disciplinas_id'
      )


end
