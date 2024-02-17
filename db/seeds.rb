require 'csv'

PokemonAbility.delete_all
PokemonType.delete_all
Pokemon.delete_all
Ability.delete_all
Region.delete_all

filename = Rails.root.join("db/pokemon.csv")

puts "Successfully opened #{filename}"

csv_data = File.read(filename)
pokemons = CSV.parse(csv_data, headers: true, encoding: "utf-8")

pokemons.each do |p|
  region = Region.find_or_create_by(name: p["region"])

  pokemon = region.pokemons.create(
    name:               p["name"],
    pokedex_entry:      p["pokedex_entry"],
    species:            p["species"],
    height:             p["height_m"],
    weight:             p["weight_kg"],
    health:             p["hp"],
    attack:             p["attack"],
    defense:            p["defense"],
    special_attack:     p["sp_attack"],
    special_defense:    p["sp_defense"],
    speed:              p["speed"]
  )
  puts "Invalid Pokemon #{p["name"]}" unless pokemon&.valid?

  abilities = [p["ability_1"], p["ability_2"], p["ability_hidden"]].reject(&:blank?)

  abilities.each do |a|
    ability = Ability.find_or_create_by(name: a)
    PokemonAbility.create(pokemon: pokemon, ability: ability)
  end

  types = [p["type_1"], p["type_2"]].reject(&:blank?)

  types.each do |t|
    type = Type.find_or_create_by(name: t)
    PokemonType.create(pokemon: pokemon, type: type)
  end

  puts p["name"]
end

puts "success"