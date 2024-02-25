class Region < ApplicationRecord
  has_many :pokemons

  validates :name, :generation, presence: true
  validates :name, uniqueness: true
end
