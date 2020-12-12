class Character < ApplicationRecord
    has_many :character_skills
    has_one :character_career
end
