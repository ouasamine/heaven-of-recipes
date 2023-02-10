class RecipeFoodController < ApplicationController
    def new
        @foods = Food.all
        @new_recipe_food = RecipeFood.new
    end
    
    def create
        @new_recipe_food = RecipeFood.new(
            food_id: params[:recipe_food][:food_id],
            recipe_id: params[:recipe_food][:recipe_id],
            quantity: params[:recipe_food][:quantity]
        )
    
        return unless @new_recipe_food.save
    
        flash[:success] = 'Food added to recipe successfully'
        redirect_to recipes_path
    end
    
    def destroy
        @target_recipe_food = RecipeFood.find(params[:id])
    
        return unless @target_recipe_food.destroy
    
        flash[:success] = 'The food has been deleted successfully'
        redirect_to recipe_path(@target_recipe_food.recipe_id)
    end
    
    private
    
    def recipe_food_params
        params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
    end
end