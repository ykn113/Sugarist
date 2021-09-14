class Recipe < ApplicationRecord

  is_impressionable counter_cache: true

  belongs_to :user
  belongs_to :genre
  has_many :recipe_tags, dependent: :destroy
  has_many :tags,through: :recipe_tags

  attachment :recipe_image

  validates :name, :recipe_image, :ingredient, :method, :cooking_time, :serve, :genre_id, presence: true
  validates :rate, presence: true, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }


  enum cooking_time: {
    '30分以下': 1, '60分以下': 2, '60分以上': 3
  }

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
    
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tag = Tag.find_by(tag_name: old)
      self.recipe_tags.delete RecipeTag.find_by(tag_id: tag.id,recipe_id: self.id)
    end
    # ↑今あるタグを削除
    # ↓新しくタグを作る
    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(tag_name: new)
      unless RecipeTag.exists?(tag_id: new_tag.id,recipe_id: self.id)
        new_recipe_tag = RecipeTag.create(tag_id: new_tag.id,recipe_id: self.id)
        self.recipe_tags << new_recipe_tag
      end
    end
  end

end
