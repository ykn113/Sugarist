class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end
  
  def show
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def favorite
  end
  
  def unfavorite
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :recipe_image, :ingredient, :method, :cooking_time, :serve, :rate, :memo, :favorite)
  end
  
end
