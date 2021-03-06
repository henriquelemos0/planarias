# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111004170214) do

  create_table "alternativas", :force => true do |t|
    t.string   "nome",              :null => false
    t.integer  "caracteristica_id", :null => false
    t.string   "nome_imagem"
    t.string   "content_type"
    t.binary   "imagem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alternativas_especies", :id => false, :force => true do |t|
    t.integer  "especie_id",     :null => false
    t.integer  "alternativa_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artigos", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "link",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artigos_especies", :id => false, :force => true do |t|
    t.integer  "especie_id", :null => false
    t.integer  "artigo_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "caracteristicas", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "especie_imagens", :force => true do |t|
    t.string   "nome",         :null => false
    t.string   "legenda"
    t.string   "content_type", :null => false
    t.binary   "data",         :null => false
    t.integer  "especie_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "especies", :force => true do |t|
    t.string   "nome"
    t.text     "bibliografia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "especies_generos", :id => false, :force => true do |t|
    t.integer  "especie_id", :null => false
    t.integer  "genero_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "especies_municipios", :id => false, :force => true do |t|
    t.integer "especie_id"
    t.integer "municipio_id"
  end

  create_table "estados", :force => true do |t|
    t.string   "nome",       :null => false
    t.integer  "pais_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "familias", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generos", :force => true do |t|
    t.string   "nome",          :null => false
    t.integer  "subfamilia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "municipios", :force => true do |t|
    t.string   "nome",       :null => false
    t.integer  "estado_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paises", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "subfamilias", :force => true do |t|
    t.string   "nome",       :null => false
    t.integer  "familia_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
