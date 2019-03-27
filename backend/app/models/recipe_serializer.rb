class RecipeSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :tags, through: :recipe_tags
  has_many :comments

  attributes :id, :user_id, :ingredient_blob, :ingredients, :directions, :cooking_time, :image_url, :title, :source_url, :comments, :tags, :created_at, :updated_at
end
