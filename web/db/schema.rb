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

ActiveRecord::Schema[7.0].define(version: 2022_12_27_131855) do
  create_table "feeds", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "source_url", null: false, comment: "ソースURL"
    t.string "title", comment: "タイトル"
    t.text "description", comment: "説明"
    t.string "language_code", comment: "言語コード"
    t.string "link_url", comment: "リンク先URL"
    t.datetime "modified_at", comment: "更改日時"
    t.datetime "crawled_at", comment: "クロール日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_url"], name: "index_feeds_on_source_url", unique: true
  end

  create_table "items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "feed_id", null: false, comment: "フィードID"
    t.string "title", null: false, comment: "タイトル"
    t.text "description", comment: "説明"
    t.string "link_url", null: false, comment: "リンク先URL"
    t.datetime "published_at", null: false, comment: "公開日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_items_on_feed_id"
  end

  create_table "subscriptions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.bigint "feed_id", null: false, comment: "フィードID"
    t.string "title", comment: "タイトル"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_subscriptions_on_feed_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firebase_uid", null: false, collation: "utf8mb4_bin", comment: "Firebase UID"
    t.string "name", null: false, comment: "名前"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firebase_uid"], name: "index_users_on_firebase_uid", unique: true
  end

  add_foreign_key "items", "feeds"
  add_foreign_key "subscriptions", "feeds"
  add_foreign_key "subscriptions", "users"
end
