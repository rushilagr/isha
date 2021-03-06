class CallTask < ApplicationRecord
  belongs_to :creator, :class_name => 'User'

  has_many :call_task_callers, dependent: :destroy
  has_many :callers, through: :call_task_callers, class_name: 'User'
  alias :ctcs :call_task_callers

  has_many :call_task_participants, dependent: :destroy
  has_many :participants, through: :call_task_participants
  alias :ctps :call_task_participants

  validates :name, presence: true
  validates :script, presence: true
  validates_presence_of :sms_script, :if => :have_sms_script?

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
      SMS.send_call_task_to_caller caller.name, caller.phone, name, current_user.name, current_user.phone
    end
  end

  def assign_new_participant_to_caller ctc_id
    ctp = call_task_participants.unassigned.limit(1).first
    ctp &.update call_task_caller_id: ctc_id, status: 'currently_shown'
    ctp
  end
end
