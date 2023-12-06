class Api::V1::HeroesController < ApplicationController

  #before_action :set_hero, only: %i[] #show update destroy

  def index
    @heroes = Hero.all 
    render json: @heroes
  end

private

def set_hero
  @hero = Hero.find(params[:id])
end

def hero_params
  params.require(:hero).permit(:name, :description)
end

end