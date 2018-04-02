class Participant < ApplicationRecord
  belongs_to :city
  has_many :program_participants
  has_many :programs, through: :program_participants

  # has_many :attendance, through: :program_participants

end
