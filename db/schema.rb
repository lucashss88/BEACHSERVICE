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

ActiveRecord::Schema[7.0].define(version: 2023_11_08_203525) do
  create_table "categories", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.string "sender_name"
    t.string "receiver_name"
    t.text "message"
    t.datetime "date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_category_enums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "nome"
    t.float "preco_unitario"
    t.string "descricao"
    t.integer "quantidade"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "valor_total"
    t.boolean "status"
    t.integer "numero_mesa"
    t.integer "item_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "forma_pagamento"
    t.float "valor"
    t.date "data"
    t.integer "client_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  add_foreign_key "items", "categories"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "items"
  add_foreign_key "payments", "clients"
  add_foreign_key "payments", "orders"
end
