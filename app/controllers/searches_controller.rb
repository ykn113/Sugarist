class SearchesController < ApplicationController
  before_action :set_genre

  def search
    @recipes = current_user.recipes.page(params[:page]).search(params[:keyword])
    @keyword = params[:keyword]
    @name = current_user.recipes.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
    @all_recipes_count = @recipes.total_count
  end

  private

  def set_genre
    @genres = Genre.all
  end
end