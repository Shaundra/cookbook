class Recipe < ApplicationRecord
  belongs_to :user, required: false
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags
  has_many :comments

  validates :title, presence: true

  def self.search_recipe_ingredients(search_term)
    results = Recipe.where('ingredient_blob ilike ?', "%#{search_term}%")
    # byebug
    results.empty? ?  ["No Recipes Found"] : results
  end
end
