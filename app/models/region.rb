class Region < ApplicationRecord
  has_many :pokemons

  validates :name, uniqueness: true
end
