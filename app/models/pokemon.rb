class Pokemon < ApplicationRecord
  belongs_to :region
  has_many :pokemon_abilities
  has_many :abilities, through: :pokemon_abilities
end
