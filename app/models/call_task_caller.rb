class CallTaskCaller < ApplicationRecord
  belongs_to :call_task
  belongs_to :caller, class_name: 'User'

  has_many :call_task_participants
  has_many :participants, through: :call_task_participants
  alias :ctps :call_task_participants

  ## Each caller for a call_task should be unique
  validates :caller_id, uniqueness: { scope: :call_task_id }

  delegate :phone, :name, :max_calls_per_caller, to: :call_task, prefix: 'call_task'

  [:call_back, :got_reply, :never_contact, :completed, :pending, :unassigned, :currently_shown].each do |type|
    define_method (type.to_s + '_participants') { call_task_participants.send type }
  end

  scope :started, -> { joins(:call_task_participants).distinct }
  scope :target_reached, -> { select { |ctc| ctc.target_reached? } }
  scope :target_not_reached, -> { select { |ctc| !ctc.target_reached? } }

  def current_participant
    call_task_participants.currently_shown.first
  end

  def assign_new_participant
    call_task.assign_new_participant_to_caller(id)
  end

  def target_reached?
    completed_participants.count >= call_task_max_calls_per_caller
  end

  def current_or_new_call_present?
    current_participant || call_task.call_task_participants.unassigned.present?
  end

  def completed?
    target_reached? && !current_participant && pending_participants.empty?
  end

  def started?
    ctps.present?
  end
end
