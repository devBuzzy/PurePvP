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

ActiveRecord::Schema.define(version: 20150207224903) do

  create_table "deaths", force: :cascade do |t|
    t.string "killer_uuid"
    t.string "victim_uuid"
    t.string "server_session_id"
    t.string "weapon"
    t.time   "timestamp"
    t.string "gamemode"
  end

  add_index "deaths", ["killer_uuid"], name: "index_deaths_on_killer_uuid"
  add_index "deaths", ["victim_uuid"], name: "index_deaths_on_victim_uuid"

  create_table "forem_categories", force: :cascade do |t|
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "position",   default: 0
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true

  create_table "forem_forums", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
    t.integer "position",    default: 0
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true

  create_table "forem_groups", force: :cascade do |t|
    t.string  "name"
    t.string  "color"
    t.string  "badge_text"
    t.string  "badge_color"
    t.integer "priority"
    t.boolean "show_on_staff_page", default: false
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name"

  create_table "forem_memberships", force: :cascade do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", force: :cascade do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", force: :cascade do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       default: "pending_review"
    t.boolean  "notified",    default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", force: :cascade do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: :cascade do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",       default: false,            null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "pending_review"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id"

  create_table "forem_views", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id"

  create_table "minecraft_users", force: :cascade do |t|
    t.string "username"
    t.string "uuid"
  end

  add_index "minecraft_users", ["uuid"], name: "index_minecraft_users_on_uuid", unique: true

  create_table "punishments", force: :cascade do |t|
    t.string "reason"
    t.string "punishment_type"
    t.time   "expires_at"
    t.time   "punished_at"
    t.string "punisher"
    t.string "punished"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "reporter_id"
    t.text     "reason"
    t.text     "evidence"
    t.boolean  "closed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "server_families", force: :cascade do |t|
    t.string  "display"
    t.string  "gamemode"
    t.integer "priority"
  end

  create_table "servers", force: :cascade do |t|
    t.string   "name"
    t.string   "ip"
    t.integer  "port"
    t.time     "last_ping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "forem_admin",            default: false
    t.string   "forem_state",            default: "pending_review"
    t.boolean  "forem_auto_subscribe",   default: false
    t.string   "uuid"
    t.time     "first_join"
    t.time     "last_join"
    t.time     "last_seen"
    t.string   "color"
    t.string   "badge_text"
    t.string   "badge_color"
    t.text     "username_history"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
