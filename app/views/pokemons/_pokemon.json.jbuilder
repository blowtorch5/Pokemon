json.extract! pokemon, :id, :name, :types, :pokedex-entry, :region_id, :abilities_id, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
