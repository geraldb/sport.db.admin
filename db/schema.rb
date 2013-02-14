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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121004210237) do

  create_table "badges", :force => true do |t|
    t.integer  "team_id",    :null => false
    t.integer  "league_id",  :null => false
    t.integer  "season_id",  :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "key",                           :null => false
    t.string   "code"
    t.string   "synonyms"
    t.integer  "country_id",                    :null => false
    t.integer  "region_id"
    t.integer  "city_id"
    t.integer  "pop"
    t.integer  "popm"
    t.integer  "area"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "m",          :default => false, :null => false
    t.boolean  "c",          :default => false, :null => false
    t.boolean  "d",          :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "key",                           :null => false
    t.string   "code",                          :null => false
    t.string   "synonyms"
    t.integer  "pop",                           :null => false
    t.integer  "area",                          :null => false
    t.integer  "country_id"
    t.boolean  "s",          :default => false, :null => false
    t.boolean  "c",          :default => false, :null => false
    t.boolean  "d",          :default => false, :null => false
    t.string   "motor"
    t.string   "iso2"
    t.string   "iso3"
    t.string   "fifa"
    t.string   "net"
    t.string   "wikipedia"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "countries", ["code"], :name => "index_countries_on_code", :unique => true
  add_index "countries", ["key"], :name => "index_countries_on_key", :unique => true

  create_table "events", :force => true do |t|
    t.string   "key",                          :null => false
    t.integer  "league_id",                    :null => false
    t.integer  "season_id",                    :null => false
    t.datetime "start_at",                     :null => false
    t.datetime "end_at"
    t.boolean  "team3",      :default => true, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "events", ["key"], :name => "index_events_on_key", :unique => true

  create_table "events_teams", :force => true do |t|
    t.integer  "event_id",   :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "events_teams", ["event_id", "team_id"], :name => "index_events_teams_on_event_id_and_team_id", :unique => true
  add_index "events_teams", ["event_id"], :name => "index_events_teams_on_event_id"

  create_table "games", :force => true do |t|
    t.integer  "round_id",                        :null => false
    t.integer  "pos",                             :null => false
    t.integer  "group_id"
    t.integer  "team1_id",                        :null => false
    t.integer  "team2_id",                        :null => false
    t.datetime "play_at",                         :null => false
    t.boolean  "knockout",     :default => false, :null => false
    t.boolean  "home",         :default => true,  :null => false
    t.integer  "score1"
    t.integer  "score2"
    t.integer  "score3"
    t.integer  "score4"
    t.integer  "score5"
    t.integer  "score6"
    t.integer  "next_game_id"
    t.integer  "prev_game_id"
    t.string   "toto12x"
    t.string   "key"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "games", ["group_id"], :name => "index_games_on_group_id"
  add_index "games", ["key"], :name => "index_games_on_key", :unique => true
  add_index "games", ["next_game_id"], :name => "index_games_on_next_game_id"
  add_index "games", ["prev_game_id"], :name => "index_games_on_prev_game_id"
  add_index "games", ["round_id"], :name => "index_games_on_round_id"

  create_table "groups", :force => true do |t|
    t.integer  "event_id",   :null => false
    t.string   "title",      :null => false
    t.integer  "pos",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups", ["event_id"], :name => "index_groups_on_event_id"

  create_table "groups_teams", :force => true do |t|
    t.integer  "group_id",   :null => false
    t.integer  "team_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups_teams", ["group_id", "team_id"], :name => "index_groups_teams_on_group_id_and_team_id", :unique => true
  add_index "groups_teams", ["group_id"], :name => "index_groups_teams_on_group_id"

  create_table "langs", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leagues", :force => true do |t|
    t.string   "key",                           :null => false
    t.string   "title",                         :null => false
    t.integer  "country_id"
    t.boolean  "club",       :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "logs", :force => true do |t|
    t.string   "msg",        :null => false
    t.string   "level",      :null => false
    t.string   "app"
    t.string   "tag"
    t.integer  "pid"
    t.string   "tid"
    t.string   "ts"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "props", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "key",        :null => false
    t.string   "code"
    t.string   "synonyms"
    t.integer  "country_id", :null => false
    t.integer  "pop"
    t.integer  "area"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["key", "country_id"], :name => "index_regions_on_key_and_country_id", :unique => true

  create_table "rounds", :force => true do |t|
    t.integer  "event_id",                      :null => false
    t.string   "title",                         :null => false
    t.string   "title2"
    t.integer  "pos",                           :null => false
    t.boolean  "knockout",   :default => false, :null => false
    t.datetime "start_at",                      :null => false
    t.datetime "end_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "rounds", ["event_id"], :name => "index_rounds_on_event_id"

  create_table "seasons", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",        :null => false
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string   "key",                       :null => false
    t.string   "slug",                      :null => false
    t.string   "title"
    t.integer  "grade",      :default => 1, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "tags", ["key"], :name => "index_tags_on_key", :unique => true

  create_table "teams", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "title2"
    t.string   "key",                           :null => false
    t.string   "code"
    t.string   "synonyms"
    t.integer  "country_id",                    :null => false
    t.integer  "city_id"
    t.boolean  "club",       :default => false, :null => false
    t.boolean  "national",   :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "teams", ["key"], :name => "index_teams_on_key", :unique => true

  create_table "usages", :force => true do |t|
    t.integer  "country_id",                    :null => false
    t.integer  "lang_id",                       :null => false
    t.boolean  "official",   :default => true,  :null => false
    t.boolean  "minor",      :default => false, :null => false
    t.float    "percent"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
