class Pokemon < ApplicationRecord
  belongs_to :region
  has_many :pokemon_abilities
  has_many :abilities, through: :pokemon_abilities
  has_many :pokemon_types
  has_many :types, through: :pokemon_types
end
