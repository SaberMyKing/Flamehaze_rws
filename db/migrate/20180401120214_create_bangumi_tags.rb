class CreateBangumiTags < ActiveRecord::Migration[5.1]
  def change
    create_table :bangumi_tags do |t|
      t.integer :bangumi_id,  null: false,  limit: 8
      t.integer :tag_id,      null: false,  limit: 8

      t.timestamps
    end

    add_foreign_key :bangumi_tags, :bangumis, column: :bangumi_id, primary_key: :id,
                    name: :fk_bangumi_tags_reference_bangumi_id
    add_foreign_key :bangumi_tags, :tags, column: :tag_id, primary_key: :id,
                    name: :fk_bangumi_tags_reference_tag_id
  end
end
