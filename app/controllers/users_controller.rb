class UsersController < ApplicationController
  def index
    @favorite_recipes = current_user.recipes.where(favorite: true)
    @recipes = current_user.recipes.order(impressions_count: :desc).limit(5)
    @random_recipes = current_user.recipes.order("RANDOM()").limit(1)
  end

  def show
    @all_recipes_count = current_user.recipes.count
    @favorite_recipes_count = current_user.recipes.where(favorite: true).count
    @array = []
    Genre.all.each do |genre|
      @array.push([genre.name, genre.recipes.where(user_id: current_user.id).count])
    end
  end

  def edit
  end

  def update
  end
  
  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    
    redirect_to root_path
  end
end
