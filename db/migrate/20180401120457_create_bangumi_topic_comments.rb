class CreateBangumiTopicComments < ActiveRecord::Migration[5.1]
  def change
    create_table :bangumi_topic_comments do |t|
      t.integer :bangumi_topic_id,  null: false,  limit: 8
      t.integer :creator_id,        null: false,  limit: 8
      t.integer :like_times,        null: false,  limit: 4
      t.integer :dislike_times,        null: false,  limit: 4
      t.boolean :enabled,     null: false

      t.timestamps
    end

    add_foreign_key :bangumi_topic_comments, :bangumi_topics, column: :bangumi_topic_id, primary_key: :id,
                    name: :fk_bangumi_topic_comments_reference_bangumi_topic_id
    add_foreign_key :bangumi_topic_comments, :users, column: :creator_id, primary_key: :id,
                    name: :fk_bangumi_topic_comments_reference_creator_id
  end
end
