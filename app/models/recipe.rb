require 'recipe_data'
# require_relative 'recipe_data'
include RecipeData

class Recipe < ApplicationRecord
  has_many :meals
  has_many :meals, through: :recipes

  def self.get_recipes
    recipe_data 
  end

end

