class Character < ApplicationRecord

    has_many :character_skills, dependent: :delete_all
    has_many :skills, through: :character_skills

    has_one :character_career, dependent: :delete
    has_one :career, through: :character_career

    has_many :character_specializations, dependent: :delete_all
    has_many :specializations, through: :character_specializations

    has_many :character_spec_talents, dependent: :delete_all
    has_many :specialization_talents, through: :character_spec_talents

    has_many :character_force_powers, dependent: :delete_all
    has_many :force_powers, through: :character_force_powers
end
