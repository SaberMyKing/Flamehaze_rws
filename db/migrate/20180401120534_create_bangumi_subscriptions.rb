class CreateBangumiSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :bangumi_subscriptions do |t|
      t.integer :user_id,     null: false,  limit: 8
      t.integer :bangumi_id,  null: false,  limit: 8

      t.timestamps
    end

    add_foreign_key :bangumi_subscriptions, :bangumis, column: :bangumi_id, primary_key: :id,
                    name: :fk_bangumi_subscriptions_reference_bangumi_id
    add_foreign_key :bangumi_subscriptions, :users, column: :user_id, primary_key: :id,
                    name: :fk_bangumi_subscriptions_reference_user_id
  end
end
