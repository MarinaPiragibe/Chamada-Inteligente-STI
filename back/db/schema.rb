# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_28_143355) do
  create_table "aluno_pertence_turmas", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "turma_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.integer "cpf"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chamadas", force: :cascade do |t|
    t.string "hora_assinada"
    t.string "dia_assinado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "professors_id", null: false
    t.integer "turmas_id", null: false
    t.integer "alunos_id", null: false
    t.index ["alunos_id"], name: "index_chamadas_on_alunos_id"
    t.index ["professors_id"], name: "index_chamadas_on_professors_id"
    t.index ["turmas_id"], name: "index_chamadas_on_turmas_id"
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "cod_disciplina"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string "cod_turma"
    t.integer "hora_inicio"
    t.integer "hora_fim"
    t.string "dias"
    t.integer "aulas_semestre"
    t.integer "aulas_com_chamada"
    t.integer "chamada_ativa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "professors_id"
    t.integer "disciplinas_id"
    t.index ["disciplinas_id"], name: "index_turmas_on_disciplinas_id"
    t.index ["professors_id"], name: "index_turmas_on_professors_id"
  end

  add_foreign_key "chamadas", "alunos", column: "alunos_id"
  add_foreign_key "chamadas", "professors", column: "professors_id"
  add_foreign_key "chamadas", "turmas", column: "turmas_id"
  add_foreign_key "turmas", "disciplinas", column: "disciplinas_id"
  add_foreign_key "turmas", "professors", column: "professors_id"
end
