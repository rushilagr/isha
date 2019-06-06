class Participant < ApplicationRecord
  belongs_to :pin_code
  has_many :call_task_participants, dependent: :destroy
  has_many :call_tasks, through: :call_task_participants
  belongs_to :dnd_marker, class_name: 'User', optional: true

  validates :pid, presence: true
  validates :name, presence: true

  validates_date :i_e_date, allow_blank: true

  validate { errors.add(:dnd_reason, 'Required') if dnd_marker_id && dnd_reason.blank? }
  validate { errors.add(:dnd_marker_id, 'Required') if !dnd_marker_id && dnd_reason.present? }

  ## Cant do this otherwise transaction approach won't work
  # validate { errors.add(:base, 'Phone & Email must be deleted if dnd') if dnd? && (name.present? || email.present?) }

  before_create :strip_all_strings
  before_save :nullify_invalid_phone_numbers

  scope :valid_phone, -> {where.not(phone: nil)}
  scope :not_dnd, -> {where(dnd_reason: nil, dnd_marker_id: nil)}

  def strip_all_strings
    ["pid", "name", "phone", "email", "gender", "occupation", "company", "i_e_program_type", "i_e_center", "i_e_teacher"]
      .each do |atr|
        atr_value = instance_eval(atr)
        self.send("#{atr}=", atr_value.strip) if atr_value
      end
  end

  def nullify_invalid_phone_numbers
    self.phone = nil if self.phone && self.phone.length < 10
  end

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", 'pin_code_id', 'dnd_reason', 'dnd_marker_id']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def mark_dnd args
    transaction do
      update(args.slice :dnd_reason, :dnd_marker_id) ? update(email: nil, phone: nil) : raise(ActiveRecord::Rollback)
    end
  end

  def dnd?
    dnd_reason.present? && dnd_marker_id.present?
  end
end
