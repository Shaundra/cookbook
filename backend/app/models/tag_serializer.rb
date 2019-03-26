class TagSerializer < ActiveModel::Serializer
  has_many :recipe_tags
  has_many :recipes, through: :recipe_tags

  attributes :id, :name, :recipes, :created_at, :updated_at
end
