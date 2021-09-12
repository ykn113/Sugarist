class AddDefaultValueToRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :rate, :float, default: 0
  end
end
