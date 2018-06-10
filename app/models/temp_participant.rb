class TempParticipant < ApplicationRecord
  extend ParticipantEnums

  belongs_to :program

  validates :name, presence: true, uniqueness: { scope: [:phone, :program_id, :email] }
  validates :phone, presence: true
  validates :email, presence: true
  validates :pincode, presence: true
  validates :gender, presence: true
  validates :city, presence: true


  def to_participant
    p = Participant.new(
      attributes
        .except('city', 'id', 'program_id')
        .merge( city_id: City.find_by(name: city)&.id, temp_participant_id: id ) 
    )
    p.program_participants.build
    p
  end
end
