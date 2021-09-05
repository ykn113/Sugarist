class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredient
      t.string :method
      t.integer :cooking_time
      t.integer :serve
      t.float :rate
      t.text :memo
      t.boolean :favorite

      t.timestamps
    end
  end
end
