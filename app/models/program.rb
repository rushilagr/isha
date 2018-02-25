class Program < ApplicationRecord
  belongs_to :user
  belongs_to :center
  has_many :meditators, through: :meditator_programs
  has_many :meditator_program_attendances
end
