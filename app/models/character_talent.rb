class CharacterTalent < ApplicationRecord
  belongs_to :character
  belongs_to :talent
end
