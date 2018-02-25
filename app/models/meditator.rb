class Meditator < ApplicationRecord
  has_many :programs, through: :meditator_programs
  has_many :meditator_program_attendances
end
