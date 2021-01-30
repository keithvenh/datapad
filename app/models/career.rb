class Career < ApplicationRecord
  belongs_to :book
  has_many :career_skills
end
