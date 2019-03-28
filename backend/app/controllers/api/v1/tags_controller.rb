class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    @tag = Tag.create(name: tag_params[:name])
    @recipe = Recipe.find(tag_params[:recipe_id])
    RecipeTag.create({tag: @tag, recipe: @recipe})

    render json: @recipe
  end

  private

  def tag_params
    params.permit(:name, :recipe_id)
  end
end
