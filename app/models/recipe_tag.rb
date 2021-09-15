class RecipeTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag

  validates :recipe_id, presence: true
  validates :tag_id, presence: true

  # add_index :recipe_tags, [:recipe_id, :tag_id], unique: true
end
