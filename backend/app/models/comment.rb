class Comment < ApplicationRecord
  belongs_to :recipe

  validates :rating, inclusion: { in: 0..5 }, allow_nil: true
  validates :content, length: {minimum: 4}
end
