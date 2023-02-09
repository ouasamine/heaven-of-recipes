class GeneralShoppingListController < ApplicationController
  def index
    @user_recipes = current_user.recipes
    @recipes_missing_foods = []
    @missing_foods_total_price = 0
    @missing_foods_count = 0
    @user_recipes.each do |recipe|
      @recipes_missing_foods.concat(recipe.missing_foods[:list])
      @missing_foods_total_price += recipe.missing_foods[:total_price]
      @missing_foods_count += recipe.missing_foods[:count]
    end
  end
end
