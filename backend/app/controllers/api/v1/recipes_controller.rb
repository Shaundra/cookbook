class Api::V1::RecipesController < ApplicationController
  before_action :find_recipe, only: [:update]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def create
    @recipe = Recipe.create(recipe_params)
    render json: @recipe
  end

  def update
    byebug
  end
  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :title, :ingredient_blob, :directions, :cooking_time, :image_url, :source_url)
  end

  def comments_params
    params.require(:recipe).permit(:content)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
