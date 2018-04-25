module ParticipantValidations
  extend ActiveSupport::Concern

  included do |p|
    validates :name, presence: true
    validates :phone, presence: true, :numericality => true, :length => { :is => 10}, uniqueness: true
    validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
    validates :pincode, presence: true
    validates :gender, presence: true, inclusion: {in: self.gender_enum}
  end
end
