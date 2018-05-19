class Participant < ApplicationRecord
  extend ParticipantEnums
  attr_accessor :temp_participant_id

  after_create :destroy_temp_participant

  belongs_to :city
  has_many :program_participants, dependent: :destroy, validate: true
  accepts_nested_attributes_for :program_participants
  has_many :programs, through: :program_participants

  validates :program_participants, presence: true

  validates :name, presence: true
  validates :phone, presence: true, :numericality => {message: 'Phone number mast have 10 digits only. No spaces, No symbols'}, :length => { :is => 10}, uniqueness: true
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  validates :pincode, presence: true
  validates :gender, presence: true, inclusion: {in: self.gender_enum}

  def destroy_temp_participant
    TempParticipant.find(temp_participant_id).destroy if temp_participant_id.is_a?(Integer)
  end

  def self.from_temp_participant t_p_id
    t_p = TempParticipant.find(t_p_id)

    Participant.new(
      t_p.attributes
        .except(
          'city',
          'id',
          'program_id'
        )
        .merge(
          city_id: City.find_by(name: t_p.city)&.id,
          temp_participant_id: t_p.id
        )
    )
  end
end
