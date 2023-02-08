class FoodController < ApplicationController
  def index
    @food = Food.where(user: current_user)
  end

  def new
    @new_food = Food.new
  end

  def create
    @new_food = Food.new(food_params)

    return unless @new_food.save

    redirect_to food_index_path
  end

  def destroy
    @target_food = Food.find(params[:id])

    return unless @target_food.destroy

    flash[:success] = 'The food has been deleted successfully'
    redirect_to food_index_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
