class Api::V1::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def recipes
    recipes = Recipe.get_recipes
    render json: recipes
  end

end

