class Specialization < ApplicationRecord
  belongs_to :book
  belongs_to :career
  has_many :specialization_skills
  has_many :specialization_talents
end
