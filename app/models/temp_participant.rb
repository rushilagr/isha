class TempParticipant < ApplicationRecord
  extend ParticipantEnums

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :pincode, presence: true
  validates :gender, presence: true
  validates :program_central_id, presence: true

  def program
    Program.find_by central_id: program_central_id
  end

  def to_participant
    attrs = attributes
      .except('city', 'program_central_id', 'id')
      .merge(city_id: City.find_by(name: city)&.id)
    Participant.new attrs
  end
end
