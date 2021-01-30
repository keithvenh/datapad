class Character < ApplicationRecord
    has_many :character_skills
    has_one :character_career
    has_many :character_specializations
end
