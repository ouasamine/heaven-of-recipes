class RecipesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :index]
  def index
    @recipes = Recipe.where(user: current_user)
  end

  def new
    @new_recipe = Recipe.new
  end

  def create
    @new_recipe = Recipe.new(recipe_params)
    if @new_recipe.save
      flash[:success] = 'Recipe added successfully'
      redirect_to recipes_path
    else
      flash[:error] = 'Recipe not added'
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
