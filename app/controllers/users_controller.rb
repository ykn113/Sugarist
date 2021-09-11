class UsersController < ApplicationController

  def index
    @favorite_recipes = current_user.recipes.where(favorite: true)
    @recipes = Recipe.all.order(impressions_count: :desc).limit(5)
    @random_recipes = Recipe.order("RANDOM()").limit(1)
  end

  def show
    @all_recipes_count = Recipe.all.count
    @favorite_recipes_count = current_user.recipes.where(favorite: true).count

  end

  def edit
  end

  def update
  end

end
