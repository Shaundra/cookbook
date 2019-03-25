class Recipe < ApplicationRecord
  belongs_to :user, required: false
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags
  has_many :comments

  validates :title, presence: true
end
