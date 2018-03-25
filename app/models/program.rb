class Program < ApplicationRecord
  belongs_to :user
  belongs_to :center
  has_many :meditators, through: :meditator_programs
  has_many :meditator_program_attendances
  serialize :batches

  validates_date :starts_at, presence: true, :after => lambda { Date.current }, before: :ends_at, before_message: 'Must be before end_date', after_message: 'Must be after today'
  validates_date :ends_at, presence: true, after: :starts_at, after_message: 'Must be after start_date'
  validates :length, presence: true, numericality:{ greater_than: 0, less_than: 30}
  validates :batches, presence: true
  validate :batch_enum
  validates :status, presence: true, inclusion: {in: ['pending', 'ongoing', 'ended']}
  validates :teachers, presence: true

  def batch_enum
    unless batches.all? { |b| ['Morning', 'Afternoon', 'Evening'].include? b }
      errors.add(:batches, "Select one or more")
    end
  end
end
