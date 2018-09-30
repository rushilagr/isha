class CallTask < ApplicationRecord
  belongs_to :creator, :class_name => 'User'

  has_many :call_task_callers
  has_many :callers, through: :call_task_callers, class_name: 'User'

  has_many :call_task_participants
  has_many :participants, through: :call_task_participants

  validates :name, presence: true

  validates :max_calls_per_caller, numericality: {greater_than: 0}, allow_blank: true
  validate do
   errors.add(:max_calls_per_caller, 'Must be <= size of calling list') if max_calls_per_caller > participants.count
  end

  def incomplete?
    (!participants_created || !callers_created || max_calls_per_caller.nil? ) ? true : false
  end

  def calculate_average_calls_per_caller
    (participants.count / callers.count.to_f).to_i
  end

end
