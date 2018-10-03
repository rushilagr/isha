class CallTaskParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :call_task
  belongs_to :call_task_caller, optional: true

  delegate :caller, :to => :call_task_caller, :allow_nil => true

  ## Each callee for a call_task should be unique
  validates :participant_id, uniqueness: { scope: :call_task_id }

  ## Statuses
  define_singleton_method(:caller_submittable_statuses) { ['picked_up', 'not_picked_up', 'call_back', 'wrong_number', 'dnd'] }
  define_singleton_method(:statuses) { ['unassigned', 'currently_shown'] + caller_submittable_statuses }
  validates :status, presence: true, inclusion: {in: self.statuses}
  validate do
    if status == 'dnd' && (caller_comment.nil? || caller_comment.empty?)
      errors.add(:caller_comment, "Can't be empty")
    end
  end

  ## New obj should have pre-assigned status
  after_initialize do |user|
    user.status = :unassigned if user.status.nil?
  end

  ## New obj should have pre-assigned status
  before_save do |user|
    user.status = :currently_shown if user.status == :unassigned && !user.call_task_caller_id.nil?
  end

  scope :pending, -> {where('status=? OR status=?', 'currently_shown', 'call_back')}
  scope :completed, -> {where.not(id: pending + unassigned)}
  scope :unassigned, -> {where(status: 'unassigned')}
  scope :call_back, -> {where(status: 'call_back')}
  scope :currently_shown, -> {where(status: 'currently_shown')}

  delegate :phone, :name, to: :participant
end
