class SearchesController < ApplicationController
  
  def search
    @recipe = current_user.recipes.search(params[:keyword])
    @keyword = params[:keyword]
    @name = current_user.recipes.search(params[:keyword])
      respond_to do |format|
        format.html
        format.json
      end
  
    @genres = Genre.all
    @tag_list = Tag.all
    # ↓ジャンル検索
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      @recipes = @genre.recipes.where(user_id: current_user.id).page(params[:page]).per(6)
    # ↓タグ検索
    elsif params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @recipes = @tag.recipes.where(user_id: current_user.id).page(params[:page]).per(6)
      @recipe_tag = @tag.tag_name
     # ↓すべて
    else
      @recipes = current_user.recipes.page(params[:page]).per(6).order(id: "DESC")
    end
    @all_recipes_count = @recipes.total_count
  end
  
end
