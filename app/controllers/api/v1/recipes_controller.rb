class Api::V1::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def recipes
    recipes = Recipe.get_recipes
    # render json: recipes
    recipes_json = JSON.parse(recipes)
    recipes_json["recipes"].each do |recipe|
      new_recipe = Recipe.new("name": recipe["title"])    
      if new_recipe
        new_recipe.save
      else
        puts `#{recipe["title"]} with id:#{recipe["recipe_id"]} could not be saved`
      end
    end
  end

end

