class CreateBangumis < ActiveRecord::Migration[5.1]
  def change
    create_table :bangumis do |t|
      t.integer :creator_id,  null: false,  limit: 8
      t.string  :name,        null: false,  limit: 30
      t.date    :show_month,  null: true
      t.integer :episode_num, null: false,  limit: 4
      t.integer :like_times,  null: false,  limit: 4
      t.integer :dislike_times, null: false,  limit: 4
      t.boolean  :enabled,    null: false,  limit: 1

      t.timestamps
    end

    add_foreign_key :bangumis, :users, column: :creator_id, primary_key: :id,
                    name: :fk_bangumis_reference_creator_id
  end
end
