class CreateBangumiTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :bangumi_topics do |t|
      t.string  :title,       null: false,  limit: 100
      t.integer :bangumi_id,  null: false,  limit: 8
      t.integer :creator_id,  null: false,  limit: 8
      t.integer :episode,     null: true,   limit: 4
      t.string  :description, null: false,  limit: 200
      t.integer :read_times,  null: false,  limit: 4
      t.boolean :enabled,     null: false

      t.timestamps
    end

    add_foreign_key :bangumi_topics, :bangumis, column: :bangumi_id, primary_key: :id,
                    name: :fk_bangumi_topics_reference_bangumi_id
    add_foreign_key :bangumi_topics, :users, column: :creator_id, primary_key: :id,
                    name: :fk_bangumi_topics_reference_creator_id
  end
end
