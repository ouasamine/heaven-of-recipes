class FoodController < ApplicationController
  def index
    @food = Food.where(user: current_user)
  end
end
