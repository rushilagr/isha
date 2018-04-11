class ProgramParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :program
  has_many :participant_attendances
end
