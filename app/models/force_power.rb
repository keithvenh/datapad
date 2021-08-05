class ForcePower < ApplicationRecord
  belongs_to :book
  has_many :force_power_upgrades
end
