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

ActiveRecord::Schema.define(version: 2018_04_01_120534) do

  create_table "article_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "creator_id", null: false
    t.string "content", limit: 200, null: false
    t.bigint "parent_comment_id"
    t.boolean "enabled", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "fk_article_comments_reference_article_id"
    t.index ["creator_id"], name: "fk_article_comments_reference_creator_id"
    t.index ["parent_comment_id"], name: "fk_article_comments_reference_parent_comment_id"
  end

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.string "title", limit: 50, null: false
    t.text "content", null: false
    t.boolean "enabled", default: true, null: false
    t.integer "read_times", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "fk_articles_reference_creator_id"
  end

  create_table "bangumi_subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bangumi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bangumi_id"], name: "fk_bangumi_subscriptions_reference_bangumi_id"
    t.index ["user_id"], name: "fk_bangumi_subscriptions_reference_user_id"
  end

  create_table "bangumi_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "bangumi_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bangumi_id"], name: "fk_bangumi_tags_reference_bangumi_id"
    t.index ["tag_id"], name: "fk_bangumi_tags_reference_tag_id"
  end

  create_table "bangumi_topic_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "bangumi_topic_id", null: false
    t.bigint "creator_id", null: false
    t.integer "like_times", null: false
    t.integer "dislike_times", null: false
    t.boolean "enabled", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bangumi_topic_id"], name: "fk_bangumi_topic_comments_reference_bangumi_topic_id"
    t.index ["creator_id"], name: "fk_bangumi_topic_comments_reference_creator_id"
  end

  create_table "bangumi_topics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.bigint "bangumi_id", null: false
    t.bigint "creator_id", null: false
    t.integer "episode"
    t.string "description", limit: 200, null: false
    t.integer "read_times", null: false
    t.boolean "enabled", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bangumi_id"], name: "fk_bangumi_topics_reference_bangumi_id"
    t.index ["creator_id"], name: "fk_bangumi_topics_reference_creator_id"
  end

  create_table "bangumis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.string "name", limit: 30, null: false
    t.date "show_month"
    t.integer "episode_num", null: false
    t.integer "like_times", null: false
    t.integer "dislike_times", null: false
    t.boolean "enabled", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "fk_bangumis_reference_creator_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description", limit: 30, null: false
    t.boolean "enabled", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.boolean "enabled", default: true, null: false
    t.integer "uid", null: false
    t.integer "level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "article_comments", "article_comments", column: "parent_comment_id", name: "fk_article_comments_reference_parent_comment_id"
  add_foreign_key "article_comments", "articles", name: "fk_article_comments_reference_article_id"
  add_foreign_key "article_comments", "users", column: "creator_id", name: "fk_article_comments_reference_creator_id"
  add_foreign_key "articles", "users", column: "creator_id", name: "fk_articles_reference_creator_id"
  add_foreign_key "bangumi_subscriptions", "bangumis", name: "fk_bangumi_subscriptions_reference_bangumi_id"
  add_foreign_key "bangumi_subscriptions", "users", name: "fk_bangumi_subscriptions_reference_user_id"
  add_foreign_key "bangumi_tags", "bangumis", name: "fk_bangumi_tags_reference_bangumi_id"
  add_foreign_key "bangumi_tags", "tags", name: "fk_bangumi_tags_reference_tag_id"
  add_foreign_key "bangumi_topic_comments", "bangumi_topics", name: "fk_bangumi_topic_comments_reference_bangumi_topic_id"
  add_foreign_key "bangumi_topic_comments", "users", column: "creator_id", name: "fk_bangumi_topic_comments_reference_creator_id"
  add_foreign_key "bangumi_topics", "bangumis", name: "fk_bangumi_topics_reference_bangumi_id"
  add_foreign_key "bangumi_topics", "users", column: "creator_id", name: "fk_bangumi_topics_reference_creator_id"
  add_foreign_key "bangumis", "users", column: "creator_id", name: "fk_bangumis_reference_creator_id"
end
