class TempParticipant < ApplicationRecord
  extend ParticipantEnums
  belongs_to :city

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :pincode, presence: true
  validates :gender, presence: true
end
