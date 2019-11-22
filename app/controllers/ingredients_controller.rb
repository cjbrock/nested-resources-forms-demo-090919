class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
    binding.pry
    @ingredient = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @ingredient = @recipe.ingredients.build(ingredient_params)
    if @ingredient.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
    redirect_to ingredients_path if !@ingredient
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_id)
  end
end
