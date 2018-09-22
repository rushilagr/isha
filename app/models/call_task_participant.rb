class CallTaskParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :call_task
  belongs_to :call_task_caller, optional: true

  delegate :caller, :to => :call_task_caller, :allow_nil => true

  ## Each callee for a call_task should be unique
  validates :participant_id, uniqueness: { scope: :call_task_id }

  def self.statuses
    ['unassigned', 'currently_shown', 'picked_up', 'not_picked_up', 'call_back', 'wrong_number', 'dnd']
  end
  validates :status, presence: true, inclusion: {in: self.statuses}

  ## New obj should have pre-assigned status
  after_initialize do |user|
    user.status = :unassigned if user.status.nil?
  end

  ## New obj should have pre-assigned status
  before_save do |user|
    user.status = :currently_shown if user.status == :unassigned && !user.call_task_caller_id.nil?
  end
end
