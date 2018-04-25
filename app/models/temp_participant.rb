class TempParticipant < ApplicationRecord
  extend ParticipantEnums
  belongs_to :city

  include ParticipantValidations
end
