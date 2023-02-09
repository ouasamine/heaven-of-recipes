class RecipesController < ApplicationController
    def index
        @recipes = Recipe.where(user: current_user)
    end

    def new
        @new_recipe = Recipe.new
    end
end