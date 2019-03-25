class Tag < ApplicationRecord
  has_many :recipes, through: :recipe_tags

  validates :name, uniqueness: true
end
