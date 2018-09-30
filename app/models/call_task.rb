class CallTask < ApplicationRecord
  belongs_to :creator, :class_name => 'User'

  has_many :call_task_callers
  has_many :callers, through: :call_task_callers, class_name: 'User'

  has_many :call_task_participants
  has_many :participants, through: :call_task_participants

  validates :name, presence: true

  validates :max_calls_per_caller, numericality: {greater_than: 0}, allow_blank: true
  validate do
    if max_calls_per_caller && participants.present? && max_calls_per_caller > participants.count
      errors.add(:max_calls_per_caller, 'Must be <= size of calling list')
    end
  end

  def incomplete?
    !complete?
  end

  def complete?
    participants_confirmed && callers_confirmed && max_calls_per_caller && confirmed
  end

  def calculate_average_calls_per_caller
    (participants.count / callers.count.to_f).to_i
  end

  def send_confirmed_sms_to_callers
    callers.each do |caller|
      SMS.send_call_task_to_caller caller.name, caller.phone, name, creator.name, creator.phone
    end
  end
end
