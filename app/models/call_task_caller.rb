class CallTaskCaller < ApplicationRecord
  belongs_to :call_task
  belongs_to :caller, class_name: 'User'

  has_many :call_task_participants
  has_many :participants, through: :call_task_participants

  ## Each caller for a call_task should be unique
  validates :caller_id, uniqueness: { scope: :call_task_id }

  delegate :phone, :name, :max_calls_per_caller, to: :call_task, prefix: 'call_task'

  [:call_back, :got_reply, :never_contact, :completed, :pending, :unassigned, :currently_shown].each do |type|
    define_method (type.to_s + '_participants') { call_task_participants.send type }
  end

  def current_participant
    call_task_participants.currently_shown.first
  end

  def assign_new_participant
    call_task.assign_new_participant_to_caller(id)
  end

  alias :ctps :call_task_participants
end
