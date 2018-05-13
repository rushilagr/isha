class Program < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :user
  belongs_to :center
  has_many :program_participants
  has_many :participants, through: :program_participants
  has_many :temp_participants
  has_many :attendances, through: :program_participants

  def self.type_enum
    ['Inner Engineering 7 days', 'Inner Engineering Retreat', 'Angamardana', 'Surya Kriya', 'Bhoota Shuddi', 'Yogasana', 'Up Yoga', 'Guru Puja', 'Practice Correction IE', 'Practice Correction Hatha Yoga', 'Sathsang', "Children's Program"]
  end

  validates_date :starts_at, presence: true, :on_or_after => lambda { Date.current }, on_or_after_message: 'Must be on or after today'
  validates_date :ends_at, presence: true, on_or_after: :starts_at, on_or_after_message: 'Must be on or after start_date'
  validates :type, presence: true, inclusion: {in: self.type_enum}

  def length
    ((ends_at - starts_at)/1.day).to_i + 1
  end
end
