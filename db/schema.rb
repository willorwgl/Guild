›# This file is auto-generated from the current state of the database. Instead
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

ActiveRecord::Schema.define(version: 2020_01_22_174739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "characterName", null: false
    t.string "faction", null: false
    t.string "wowclass", null: false
    t.string "race", null: false
    t.string "gender", null: false
    t.string "realm", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "selected", default: false
    t.integer "guild_id"
    t.index ["characterName"], name: "index_characters_on_characterName"
    t.index ["realm"], name: "index_characters_on_realm"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "body", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["character_id"], name: "index_messages_on_character_id"
  end

  create_table "realms", force: :cascade do |t|
    t.string "name"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.integer "guild_id", null: false
    t.index ["guild_id"], name: "index_rooms_on_guild_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "session_token", null: false
    t.string "password_digest", null: false
    t.index ["session_token"], name: "index_users_on_session_token"
    t.index ["username"], name: "index_users_on_username"
  end

  create_table "wowguilds", force: :cascade do |t|
    t.string "name", null: false
    t.string "faction", null: false
    t.string "realm", null: false
    t.string "description"
    t.string "guildtype", null: false
    t.index ["name"], name: "index_wowguilds_on_name"
    t.index ["realm"], name: "index_wowguilds_on_realm"
  end

end
