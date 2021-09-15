class RecipesController < ApplicationController
  impressionist :actions => [:show]

  def index
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

  def show
    @recipe = Recipe.find(params[:id])
    redirect_to users_path unless current_user == @recipe.user
    @recipe_tags = @recipe.tags
    impressionist(@recipe, nil, unique: [:ip_address])
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
      redirect_to recipe_path(@recipe.id), notice: "You have created recipe successfully."
    else
      @genre_list = Genre.pluck('name, id')
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
      redirect_to recipe_path(@recipe.id), notice: 'You have updated recipe successfully.'
    else
      @genre_list = Genre.pluck('name, id')
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def favorite
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.favorite
      @recipe.update(favorite: false)
    else
      @recipe.update(favorite: true)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :recipe_image, :ingredient, :method, :cooking_time, :serve, :memo, :genre_id, :rate)
  end
end
