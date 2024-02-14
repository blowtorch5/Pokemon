class Pokemon < ApplicationRecord
  belongs_to :region
  belongs_to :abilities
end
