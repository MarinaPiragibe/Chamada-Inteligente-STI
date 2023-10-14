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

ActiveRecord::Schema[7.0].define(version: 2023_09_30_173650) do
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

  create_table "disciplinas", force: :cascade do |t|
    t.string "cod_disciplina"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.string "cod_turma"
    t.time "hora_inicio"
    t.time "hora_fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "professors_id"
    t.integer "disciplinas_id"
    t.index ["disciplinas_id"], name: "index_turmas_on_disciplinas_id"
    t.index ["professors_id"], name: "index_turmas_on_professors_id"
  end

  add_foreign_key "turmas", "disciplinas", column: "disciplinas_id"
  add_foreign_key "turmas", "professors", column: "professors_id"
end
