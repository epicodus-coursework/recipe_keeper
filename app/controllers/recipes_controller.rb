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
      redirect_to user_recipe_path(@user, @recipe)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to user_recipe_path(@user, @recipe)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(@recipe.user)
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :ingredients, :photo)
  end
end
