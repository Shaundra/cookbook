class Api::V1::RecipesController < ApplicationController
  before_action :find_recipe, only: [:update]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def create

  end

  private

  def recipe_params
    params.permit(:title, :ingredient_blob, :directions, :cooking_time, :image_url, :source_url)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end