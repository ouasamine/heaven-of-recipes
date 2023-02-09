class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def missing_food
    data = {list: [], count: 0, total_price: 0}
    recipe_foods.each do |recipe_food|
      recipe_food_quantity = recipe_food.quantity
      food_inv_quantity = recipe_food.food.quantity

      if (food_inv_quantity - recipe_food_quantity) < 0
        data[:list] << recipe_food.food
        data[:count] += 1
        data[:total_price] += recipe_food.food.price
      end
    end
    data
  end
end
