class Participant < ApplicationRecord
  extend ParticipantEnums
  attr_accessor :temp_participant_id

  after_create :destroy_temp_participant

  validates :name, presence: true
  validates :phone, presence: true, :numericality => {message: 'Phone number mast have 10 digits only. No spaces, No symbols'}, :length => { :is => 10}, uniqueness: true
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  validates :pincode, presence: true
  validates :gender, presence: true, inclusion: {in: self.gender_enum}
  validates :occupation, presence: true
end
