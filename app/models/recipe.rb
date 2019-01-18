class Recipe < ApplicationRecord
  has_many :meals
  has_many :meals, through: :recipes
end
