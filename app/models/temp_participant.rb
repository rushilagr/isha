class TempParticipant < ApplicationRecord
  extend ParticipantEnums

  belongs_to :program

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :pincode, presence: true
  validates :gender, presence: true

  def to_participant
    attrs = attributes
      .except('city', 'id', 'program_id')
      .merge(city_id: City.find_by(name: city)&.id)
    Participant.new attrs
  end
end
