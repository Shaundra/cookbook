class RecipeSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :tags, through: :recipe_tags
  has_many :comments

  attributes :ingredients, :directions, :image_url, :title, :source_url, :comments, :tags
end
