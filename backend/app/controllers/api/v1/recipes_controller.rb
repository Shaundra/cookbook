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
    @comment = Comment.create(content: comments_params[:content], recipe: @recipe)

    render json: @recipe
  end

  private

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
