class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
  end

  def create
  end

  def new
  end

  def show
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:coktail).permit(:name)
  end
end
