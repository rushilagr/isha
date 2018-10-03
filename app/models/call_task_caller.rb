class CallTaskCaller < ApplicationRecord
  belongs_to :call_task
  belongs_to :caller, class_name: 'User'

  has_many :call_task_participants
  has_many :participants, through: :call_task_participants

  ## Each caller for a call_task should be unique
  validates :caller_id, uniqueness: { scope: :call_task_id }

  delegate :phone, :name, :max_calls_per_caller, to: :call_task, prefix: 'call_task'

  def pending_participants
    call_task_participants.pending
  end

  def completed_participants
    call_task_participants.completed
  end

  def call_back_participants
    call_task_participants.call_back
  end

  def current_participant
    call_task_participants.currently_shown.first
  end

  def assign_new_participant
    call_task.assign_new_participant_to_caller(id)
  end
end
