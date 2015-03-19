class AddTagIdColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :tag_id, :integer
  end
end
