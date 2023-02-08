class FoodController < ApplicationController
  def index
    @food = Food.where(user: current_user)
  end

  def new
    @new_food = Food.new
  end

  def create
    @new_food = Food.new(food_params)

    if @new_food.save
      redirect_to food_index_path
    end
  end

  def destroy
    @target_food = Food.find(params[:id])

    if @target_food.destroy
      flash[:success] = "The food has been deleted successfully"
      redirect_to food_index_path
    end
  end

  private 

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
