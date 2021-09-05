class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :recipe_tag, dependent: :destroy
  has_many :tags,through: :recipe_tags

  attachment :recipe_image

  validates :name, :recipe_image, :ingredient, :method, :cooking_time, :serve, presence: true

end
