class HomeController < ApplicationController
  def index
    @pokemons = Pokemon.where("pokedex_entry < 10")
    @regions = Region.all
    @abilities = Ability.limit(15)
    @types = Type.all
  end
end
