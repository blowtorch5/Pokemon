class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_entry
      t.string :species
      t.float :height
      t.float :weight
      t.integer :health
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
