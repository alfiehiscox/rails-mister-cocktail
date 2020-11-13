class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
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

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
