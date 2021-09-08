class SearchesController < ApplicationController
  
  
  
  def search
    @recipe = Recipe.search(params[:keyword])
    @keyword = params[:keyword]
    
    @genres = Genre.all
    @tag_list = Tag.all
    # ↓ジャンル検索
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @recipes = @genre.recipes.page(params[:page]).per(6)
    # ↓タグ検索
    elsif params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @recipes = @tag.recipes.page(params[:page]).per(6)
      @recipe_tag = @tag.tag_name
     # ↓すべて
    else
      @recipes = Recipe.all.page(params[:page]).per(6)
    end
    @all_recipes_count = @recipes.count
  end
  
end
