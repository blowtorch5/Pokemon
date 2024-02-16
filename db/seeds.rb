require 'csv'

PokemonAbility.delete_all
PokemonType.delete_all
Pokemon.delete_all
Ability.delete_all
Region.delete_all

filename = Rails.root.join("db/pokemon-data.csv")

puts "Successfully opened #{filename}"

csv_data = File.read(filename)
pokemons = CSV.parse(csv_data, headers: true, encoding: "utf-8")

pokemons.each do |p|
  region = Region.find_or_create_by(name: p["region"])

  pokemon = region.pokemons.create(
    name:               p["name"],
    pokedex_entry:      p["pokedex_number"]
  )
  puts "Invalid Pokemon #{p["name"]}" unless pokemon&.valid?

  abilities = p["abilities"].split(",").map(&:strip)

  abilities.each do |a|
    cleaned_ability = a.delete("[]'")
    ability = Ability.find_or_create_by(name: cleaned_ability)
    PokemonAbility.create(pokemon: pokemon, ability: ability)
  end

  types = [p["type1"], p["type2"]].reject(&:blank?)

  types.each do |t|
    type = Type.find_or_create_by(name: t)
    PokemonType.create(pokemon: pokemon, type: type)
  end

  puts p["name"]
end