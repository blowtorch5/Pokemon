class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :types
      t.integer :pokedex-entry
      t.references :region, null: false, foreign_key: true
      t.references :abilities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
