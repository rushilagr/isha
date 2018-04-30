class ProgramParticipant < ApplicationRecord
  extend BatchEnum

  belongs_to :participant
  belongs_to :program
  has_many :participant_attendances

  validates :batch, presence: true, inclusion: {in: self.batch_enum}
  validates :status, presence: true, inclusion: {in: ['ongoing', 'complete', 'incomplete']}
end
