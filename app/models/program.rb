class Program < ApplicationRecord
  self.inheritance_column = :_type_disabled
  
  belongs_to :user
  belongs_to :center
  has_many :meditators, through: :meditator_programs
  has_many :meditator_program_attendances
  serialize :batches

  def self.status_enum
    ['pending', 'ongoing', 'ended']
  end

  def self.type_enum
    ['IE 4 days', 'IE 7 days', 'IE retreat']
  end

  def self.batch_enum
    ['Morning', 'Afternoon', 'Evening']
  end

  validates_date :starts_at, presence: true, :on_or_after => lambda { Date.current }, on_or_after_message: 'Must be on or after today'
  validates_date :ends_at, presence: true, on_or_after: :starts_at, on_or_after_message: 'Must be on or after start_date'

  validates :batches, presence: true
  validate :validate_batch_enum
  validates :type, presence: true, inclusion: {in: self.type_enum}
  validates :status, presence: true, inclusion: {in: self.status_enum}

  validates :central_id, presence: true
  validates :teachers, presence: true

  def validate_batch_enum
    unless batches.all? { |b| self.class.batch_enum.include? b }
      errors.add(:batches, "Select from #{batch_enum.join(', ')}")
    end
  end
  
  def length
    ((ends_at - starts_at)/1.day).to_i
  end  
end
