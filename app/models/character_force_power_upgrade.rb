class CharacterForcePowerUpgrade < ApplicationRecord
  belongs_to :character
  belongs_to :force_power_upgrade
end
