class RecipeFoodsController < ApplicationController

  def index
    
     @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:food_id])
    @recipe.foods << @food
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find(params[:id])
    @recipe.foods.delete(@food)
    redirect_to recipe_path(@recipe)
  end
end
