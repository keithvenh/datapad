class Character < ApplicationRecord
    has_many :character_skills, dependent: :delete_all
    has_one :character_career, dependent: :delete
    has_many :character_specializations, dependent: :delete_all
end
