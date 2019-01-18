class Api::V1::MealsController < ApplicationController

  def index
    @meals = Meal.all
    render json: @meals
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      render json: @meal
    else
      render json: {error: "Unable to create meal."}, status 400
    end
  end

  private

  def meal_params
    params.require(:meal)
  end
end
