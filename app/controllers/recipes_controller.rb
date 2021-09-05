class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @genre_list = Genre.pluck('name, id')
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe.id), notice:"You have created recipe successfully."
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params:[id])
    if @recipe.user.id == current_user.id
      render :edit
    else
      redirect_to :recipe_path
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id), notice:'You have updated recipe successfully.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to :recipe_path
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
