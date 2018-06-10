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
  validates :occupation, presence: true

  def dropped_out program_id
    pp = program_participants.find_by(program_id: program_id)
    pp.dropped_out.nil? ? false : true
  end

  def set_dropped_out program_id, value
    pp = program_participants.find_by(program_id: program_id)
    pp.update(dropped_out: Date.current) if value == true || value == 'true'
    pp.update(dropped_out: nil) if value == false || value == 'false'
  end

  def destroy_temp_participant
    puts temp_participant_id.class
    TempParticipant.find(temp_participant_id).destroy unless temp_participant_id.nil?
  end
end
