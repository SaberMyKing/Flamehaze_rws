class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string  :description, null: false,  limit: 30
      t.boolean :enabled,     null: false

      t.timestamps
    end
  end
end
