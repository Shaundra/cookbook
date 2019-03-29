class Api::V1::RecipesController < ApplicationController
  before_action :find_recipe, only: [:update]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def create
    @recipe = Recipe.find_or_create_by(recipe_params)
    render json: @recipe
  end

  def update
    # byebug;
    if comments_params.to_h.size > 1
      @comment = Comment.create(content: comments_params[:content], recipe: @recipe)
    else
      @recipe.update(recipe_params)
    end

    render json: @recipe
  end

  def search
    @recipes = Recipe.search_recipe_ingredients(search_params[:search_term])
    # byebug
    render json: @recipes
  end
  private

  def search_params
    params.permit(:search_term)
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :title, :ingredient_blob, :directions, :cooking_time, :image_url, :source_url)
  end

  def comments_params
    params.permit(:content, :id)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
