class Aluno < ApplicationRecord
    has_many :aluno_pertence_turmas, dependent: :destroy
    has_many :turmas, through: :aluno_pertence_turmas
end
