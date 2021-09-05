class AddUserIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :user_id, :integer
    add_column :recipes, :genre_id, :integer
  end
end
