class RecipesController < ApplicationController
  def new
    @user = User.find(params[:id])
  end

  def create

  end
end
