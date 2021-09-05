class AddRecipeImageIdToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :recipe_image_id, :string
  end
end
