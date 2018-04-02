class ProgramParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :program
end
