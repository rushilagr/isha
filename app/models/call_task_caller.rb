class CallTaskCaller < ApplicationRecord
  belongs_to :call_task
  belongs_to :caller, class_name: 'User'

  has_many :call_task_participants
  has_many :participants, through: :call_task_participants

  ## Each caller for a call_task should be unique
  validates :caller_id, uniqueness: { scope: :call_task_id }
end
