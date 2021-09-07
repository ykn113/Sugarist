class RecipesController < ApplicationController

  def index
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

  # def search
  #   @result_list = []
  #   @tag_list = Tag.where(tag_name: params[:tag_name])
  #   @tag_list.each do |tag|
  #   @result_list = @result_list + tag.recipes
  #   end
  # end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_tags = @recipe.tags
  end

  def new
    @recipe = Recipe.new
    @genre_list = Genre.pluck('name, id')
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    tag_list = params[:recipe][:tag_name].split(nil)
    if @recipe.save
      @recipe.save_tag(tag_list)
      redirect_to recipe_path(@recipe.id), notice:"You have created recipe successfully."
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genre_list = Genre.pluck('name, id')
    if @recipe.user.id == current_user.id
      render :edit
    else
      redirect_to :recipes_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all
    tag_list = params[:recipe][:tag_name].split(nil)
    if @recipe.update(recipe_params)
      @recipe.save_tag(tag_list)
      redirect_to recipe_path(@recipe.id), notice:'You have updated recipe successfully.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def favorite
  end

  def unfavorite
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :recipe_image, :ingredient, :method, :cooking_time, :serve, :memo, :genre_id)
  end

end
