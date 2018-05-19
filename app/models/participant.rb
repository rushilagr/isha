class Participant < ApplicationRecord
  extend ParticipantEnums
  attr_accessor :temp_participant_id

  belongs_to :city
  has_many :program_participants, dependent: :destroy, validate: true
  accepts_nested_attributes_for :program_participants
  has_many :programs, through: :program_participants

  validates :program_participants, presence: true

  validates :name, presence: true
  validates :phone, presence: true, :numericality => true, :length => { :is => 10}, uniqueness: true
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  validates :pincode, presence: true
  validates :gender, presence: true, inclusion: {in: self.gender_enum}
end