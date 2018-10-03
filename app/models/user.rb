class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone]

  belongs_to :center
  has_many :created_call_tasks, foreign_key: 'creator_id', class_name: 'CallTask'
  has_many :call_task_callers, foreign_key: :caller_id
  has_many :assigned_call_tasks, through: :call_task_callers, source: :call_task

  validates :phone, :presence => true, :numericality => true, :length => { :is => 10}, uniqueness: true
  validates :name, presence: true

  def self.roles; ['admin', 'volunteer', 'coordinator']; end
  validates :role, presence: true, inclusion: {in: self.roles}

  ## ------------------------------
  ## Temp password for new users
  ## ------------------------------

  def self.generate_password
    ('a'..'z').to_a.shuffle[0,8].join
  end

  ## ------------------------------
  ## Devise email removal
  ## ------------------------------

  def email_required?
   false
  end

  def will_save_change_to_email?
    false
  end

  def incomplete_calling_task?
    (created_call_tasks.any? { |ct| ct.incomplete? }) ? true : false
  end

  def last_incomplete_calling_task
    created_call_tasks.select { |ct| ct.incomplete? }.last
  end

  def admin?
    role == 'admin'
  end

  def coordinator?
    role == 'coordinator'
  end

  def volunteer?
    role == 'volunteer'
  end

  def pending_call_task_participants ct_id
    call_task_callers.find_by(call_task_id: ct_id).pending_participants
  end

  def completed_call_task_participants ct_id
    call_task_callers.find_by(call_task_id: ct_id).completed_participants
  end
end
