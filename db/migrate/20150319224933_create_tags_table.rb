class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags_tables do |t|
      t.string :name
      t.integer :recipe_id

      t.timestamp
    end
  end
end
