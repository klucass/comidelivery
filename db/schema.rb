# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160823215635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bordas", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.integer  "preco"
    t.integer  "restaurante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bordas", ["restaurante_id"], name: "index_bordas_on_restaurante_id", using: :btree

  create_table "categorias", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cozinhas", force: true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cupons", force: true do |t|
    t.string   "identificador"
    t.integer  "tipo"
    t.integer  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enderecos", force: true do |t|
    t.string   "nome"
    t.string   "estado"
    t.string   "cidade"
    t.string   "logradouro"
    t.string   "endereco"
    t.string   "numero"
    t.string   "cep"
    t.string   "ponto_referencia"
    t.integer  "usuario_id"
    t.integer  "restaurante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_pedidos", force: true do |t|
    t.integer  "item_id"
    t.integer  "pedido_id"
    t.text     "comentario"
    t.integer  "quantidade", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_pedidos", ["item_id"], name: "index_item_pedidos_on_item_id", using: :btree
  add_index "item_pedidos", ["pedido_id"], name: "index_item_pedidos_on_pedido_id", using: :btree

  create_table "itens", force: true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.string   "urlthumbimg"
    t.string   "urlimg"
    t.integer  "restaurante_id"
    t.integer  "categoria_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "preco_centavos", default: 0,     null: false
    t.string   "preco_currency", default: "BRL", null: false
    t.string   "foto_produto"
  end

  create_table "metodo_restaurantes", id: false, force: true do |t|
    t.integer  "metodo_id"
    t.integer  "restaurante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metodos", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "restaurante_id"
    t.integer  "endereco_id"
    t.integer  "metodo_id"
    t.integer  "cupom_id"
    t.integer  "status",         default: 0, null: false
    t.string   "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "send_at"
  end

  create_table "pizza_pedidos", force: true do |t|
    t.integer  "pedidos_id"
    t.string   "tamanho"
    t.integer  "bordas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pizza_pedidos", ["bordas_id"], name: "index_pizza_pedidos_on_bordas_id", using: :btree
  add_index "pizza_pedidos", ["pedidos_id"], name: "index_pizza_pedidos_on_pedidos_id", using: :btree

  create_table "pizza_restaurantes", force: true do |t|
    t.string   "tamanho"
    t.integer  "qtde_sabores"
    t.integer  "id_restaurante_id"
    t.integer  "restaurante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pizza_restaurantes", ["id_restaurante_id"], name: "index_pizza_restaurantes_on_id_restaurante_id", using: :btree
  add_index "pizza_restaurantes", ["restaurante_id"], name: "index_pizza_restaurantes_on_restaurante_id", using: :btree

  create_table "pizza_sabores", force: true do |t|
    t.integer  "pizza_pedidos_id"
    t.integer  "sabores_de_pizza_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pizza_sabores", ["pizza_pedidos_id"], name: "index_pizza_sabores_on_pizza_pedidos_id", using: :btree
  add_index "pizza_sabores", ["sabores_de_pizza_id"], name: "index_pizza_sabores_on_sabores_de_pizza_id", using: :btree

  create_table "precadastros", force: true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "telefone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurantes", force: true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
    t.string   "img_url"
    t.integer  "cozinha_id"
    t.integer  "pedido_minimo_centavos", default: 0,     null: false
    t.string   "pedido_minimo_currency", default: "BRL", null: false
    t.integer  "taxa_entrega_centavos",  default: 0,     null: false
    t.string   "taxa_entrega_currency",  default: "BRL", null: false
    t.datetime "hora_inicio"
    t.datetime "hora_fim"
    t.string   "imagem"
    t.integer  "pedido_minimo"
    t.string   "status"
    t.string   "metodo_pagamento"
  end

  add_index "restaurantes", ["cozinha_id"], name: "index_restaurantes_on_cozinha_id", using: :btree
  add_index "restaurantes", ["usuario_id"], name: "index_restaurantes_on_usuario_id", using: :btree

  create_table "sabores_de_pizzas", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.integer  "precoP"
    t.integer  "precoM"
    t.integer  "precoG"
    t.integer  "precoGG"
    t.integer  "restaurante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.string   "telefone"
  end

end
