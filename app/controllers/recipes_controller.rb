class RecipesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new( recipe_params )
    if @recipe.save
      flash[:notice] = "Recipe successfully added"
      redirect_to user_path(@recipe.user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :ingredients, :photo)
  end
end
