class Participant < ApplicationRecord
  belongs_to :city
  has_many :program_participants, dependent: :destroy
  has_many :programs, through: :program_participants
  has_many :attendances, through: :program_participants
  accepts_nested_attributes_for :program_participants, :reject_if => proc { |pp| pp['program_id'].blank?}

  def self.occupation_enum
    ["Student", "Teacher", "Professor", "Lecturer", "Software engineer", "UI developer", "Database Administrator", "Graphic designer", "Statistician", "Finance executive", "HR", "CA", "Doctor", "Marketing executive", "News and Media", "Online Blogger", "Government employee", "Defence", "Scientist", "Agriculturist", "Environmentalist", "Philosophy", "Psychology", "Artist", "Animation 2D", "Animation 3D", "Photographer", "Videographer", "Interior designer", "Event Management", "Television Artist", "Radio Artist", "Politician", "Geologist", "Zoologist", "Musician", "Economist", "Director", "Actor", "Fashion Designer", "Business", "Nurse", "Farmer", "Carpenter", "Architect", "Sound Engineer", "DJ", "Yoga Teacher", "Home Maker", "Retired", "Senior Manager IT", "Senior Manager Government", "Senior Manager defense", "Senior Manager School", "Senior Manager University", "Senior Manager MNC", "Member of RWA"]
  end

  def self.gender_enum
    ['Male', 'Female']
  end

  # validates :name, presence: true
  # validates :phone, presence: true, :numericality => true, :length => { :is => 10}, uniqueness: true
  # validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  # validates :pincode, presence: true
  # validates :gender, presence: true, inclusion: {in: self.gender_enum}
end
