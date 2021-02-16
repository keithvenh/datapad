class CharacterSpecTalent < ApplicationRecord
  belongs_to :character
  belongs_to :specialization_talent
end
