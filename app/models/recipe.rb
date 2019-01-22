class Recipe < ApplicationRecord
  has_many :meals
  has_many :meals, through: :recipes

  def self.get_recipes
    character_data = RestClient.get('http://swapi.co/api/people/1')
  end

end
