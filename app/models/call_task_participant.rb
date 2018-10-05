class CallTaskParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :call_task
  belongs_to :call_task_caller, optional: true

  delegate :caller, :to => :call_task_caller, :allow_nil => true

  ## Each callee for a call_task should be unique
  validates :participant_id, uniqueness: { scope: :call_task_id }

  ## Statuses
  define_singleton_method(:call_back_statuses) { ['Not reachable / Switched Off / No Answer', 'Asked to call back later',] }
  define_singleton_method(:got_reply_statuses) { ['Will attend', 'Cannot attend', 'Will try to attend', 'Repeatedly Unreachable / Off / No Answer'] }
  define_singleton_method(:never_contact_statuses) { ['Incorrect number', 'Do not contact again',] }

  define_singleton_method(:completed_statuses) { got_reply_statuses + never_contact_statuses }
  define_singleton_method(:caller_submittable_statuses) { completed_statuses + call_back_statuses }

  define_singleton_method(:auto_assigned_statuses) { ['unassigned', 'currently_shown'] }

  define_singleton_method(:statuses) { auto_assigned_statuses + caller_submittable_statuses }

  validates :status, presence: true, inclusion: {in: self.statuses}
  validate do
    if self.class.never_contact_statuses.include?(status) && (caller_comment.nil? || caller_comment.empty?)
      errors.add(:caller_comment, "Can't be empty")
    end
  end

  ## New obj should have pre-assigned status
  after_initialize do |user|
    user.status = :unassigned if user.status.nil?
  end

  scope :call_back, -> { where status: self.call_back_statuses }
  scope :got_reply, -> { where status: self.got_reply_statuses }
  scope :never_contact, -> { where status: self.never_contact_statuses }
  scope :completed, -> { where status: self.completed_statuses }

  scope :pending, -> {where status: self.call_back_statuses + ['currently_shown']}
  scope :unassigned, -> {where(status: 'unassigned')}
  scope :currently_shown, -> {where(status: 'currently_shown')}

  delegate :phone, :name, to: :participant
end
