class SearchesController < ApplicationController
  
  def serch
    @recipe = current_user.recipes.search(params[:keyword])
    @keyword = params[:keyword]
    @input = current_user.recipes.serach(params[:keyword])
      respond_to do |format|
        format.html
        format.json
      end
  
    @genres = Genre.all
    @tag_list = Tag.all
    # ↓ジャンル検索
    if params[:genre_id]
      @genre = @genres.find(params[:genre_id])
      redirect_to users_path if @genre.recipes.select{|recipe| recipe.user == current_user}.empty?
      @recipes = @genre.recipes.page(params[:page]).per(6)
    # ↓タグ検索
    elsif params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      redirect_to users_path if @tag.recipes.select{|recipe| recipe.user == current_user}.empty?
      @recipes = @tag.recipes.page(params[:page]).per(6)
      @recipe_tag = @tag.tag_name
     # ↓すべて
    else
      @recipes = current_user.recipes.page(params[:page]).per(6).order(id: "DESC")
    end
    @all_recipes_count = @recipes.count
  end
  
end
