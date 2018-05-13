class ProgramParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :program

  def self.status_enum
    ['ongoing', 'completed', 'dropout']
  end

  validates :status, presence: true, inclusion: {in: self.status_enum}
end
