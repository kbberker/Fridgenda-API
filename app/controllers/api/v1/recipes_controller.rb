require 'rest-client'

class Api::V1::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def recipes
    # Add API request here before production
    recipes_json = JSON.parse(recipes)
    recipes_json["recipes"].each do |recipe|
      new_recipe = Recipe.new("name": recipe["title"], "url": recipe["source_url"])    
      if new_recipe
        new_recipe.save
      else
        puts `#{recipe["title"]} with id:#{recipe["recipe_id"]} could not be saved`
      end
    end
  end

end

