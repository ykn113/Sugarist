require 'rails_helper'

RSpec.describe Recipe, "Recipeモデルに関するテスト", type: :model do
  describe 'アソシエーションのテスト' do
    context 'userとの関係' do
      it '1対Nになっている' do
        expect(Recipe.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'genreとの関係' do
      it '1対Nになっている' do
        expect(Recipe.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
    context 'recipe_tagとの関係' do
      it '1対Nになっている' do
        expect(Recipe.reflect_on_association(:recipe_tag).macro).to eq :has_many
      end
    end
    context 'tagsとの関係' do
      it '1対Nになっている' do
        expect(Recipe.reflect_on_association(:tags).macro).to eq :has_many
      end
    end
  end
end
