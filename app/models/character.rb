class Character < ApplicationRecord

    has_many :character_skills, dependent: :delete_all
    has_many :skills, through: :character_skills

    has_one :character_career, dependent: :delete
    has_one :career, through: :character_career

    has_many :character_specializations, dependent: :delete_all
    has_many :specializations, through: :character_specializations
end
