class Participant < ApplicationRecord
  extend ParticipantEnums
  
  belongs_to :city
  has_many :program_participants, dependent: :destroy
  has_many :programs, through: :program_participants
  has_many :attendances, through: :program_participants
  accepts_nested_attributes_for :program_participants, :reject_if => proc { |pp| pp['program_id'].blank?}

  include ParticipantValidations
end
