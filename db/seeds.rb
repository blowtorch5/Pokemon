require 'csv'

Pokemon.delete_all
Ability.delete_all
PokemonAbility.delete_all
Region.delete_all

filename = Rails.root.join("db/pokemon-data.csv")

puts "Successfully opened #{filename}"

csv_data = File.read(filename)
pokemons = CSV.parse(csv_data, headers: true, encoding: "utf-8")

pokemons.each do |p|
  region = Region.find_or_create_by(name: p["generation"])

  pokemon = region.pokemons.create(
    name:               p["name"],
    pokedex_entry:      p["pokedex_number"]
  )
  puts "Invalid Pokemon #{p["name"]}" unless pokemon&.valid?

  abilities = [p["type1"] + p["type2"]].compact

  abilities.each do |a|
    ability = Ability.find_or_create_by(name: a)
    PokemonAbility.create(pokemon: pokemon, ability: ability)
  end
  puts p["name"]
end