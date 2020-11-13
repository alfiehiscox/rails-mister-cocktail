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
    redirect_to root_path
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.description = description_params[:description]
    @cocktail.save
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def description_params
    params.require(:cocktail).permit(:description)
  end
end
