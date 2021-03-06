class UsersController < ApplicationController
  def index
    @favorite_recipes = current_user.recipes.where(favorite: true)
    @recipes = current_user.recipes.order(impressions_count: :desc).limit(5)
    # デプロイ用
    order_random = "RANDOM()"
    if Rails.env.production?
      order_random = "RAND()"
    end

    @random_recipes = current_user.recipes.order(order_random).limit(1)
  end

  def show
    @all_recipes_count = current_user.recipes.count
    @favorite_recipes_count = current_user.recipes.where(favorite: true).count
    @array = []
    Genre.all.each do |genre|
      @array.push([genre.name, genre.recipes.where(user_id: current_user.id).count])
    end
  end
  
  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end
end
