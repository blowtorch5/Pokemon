class AddColumnsToPokemon < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :species, :string
    add_column :pokemons, :height, :float
    add_column :pokemons, :weight, :float
    add_column :pokemons, :health, :integer
    add_column :pokemons, :attack, :integer
    add_column :pokemons, :defense, :integer
    add_column :pokemons, :special_attack, :integer
    add_column :pokemons, :special_defense, :integer
    add_column :pokemons, :speed, :integer
  end
end
