class CallTask < ApplicationRecord
  belongs_to :creator, :class_name => 'User'

  has_many :call_task_callers
  has_many :callers, through: :call_task_callers, class_name: 'User'

  has_many :call_task_participants
  has_many :participants, through: :call_task_participants

  validates :name, presence: true

  def incomplete?
    (participants.count == 0 || callers.count == 0) ? true : false
  end
end
