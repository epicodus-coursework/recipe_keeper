class AddColumnsToRecipesTable < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredients, :string
    add_column :recipes, :user_id, :integer
  end
end
