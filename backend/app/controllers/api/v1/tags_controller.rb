class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    @recipe = Recipe.find(tag_params[:recipe_id])
    RecipeTag.where('recipe_id = ?', @recipe.id).destroy_all

    tag_params[:names].each do |name|
      @tag = Tag.find_or_create_by(name: name)
      RecipeTag.create({tag: @tag, recipe: @recipe})
    end

    render json: @recipe
  end

  private

  def tag_params
    params.permit(:name, :recipe_id, names: [])
  end
end
