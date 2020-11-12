class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @img_number = rand(1..4)
  end

  def create
    cocktail = Cocktail.create(cocktail_params)
    redirect_to cocktail_path(cocktail.id)
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
