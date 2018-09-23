class Participant < ApplicationRecord
  belongs_to :pin_code
  has_many :call_task_participants
  has_many :call_tasks, through: :call_task_participants

  validates :pid, presence: true
  validates :name, presence: true

  validates_date :dob, allow_blank: true
  validates_date :i_e_date, allow_blank: true
  validates_date :shoonya_date, allow_blank: true
  validates_date :bsp_date, allow_blank: true
  validates_date :silence_date, allow_blank: true
  validates_date :hata_yoga_date, allow_blank: true

  before_create :strip_all_strings

  scope :valid_phone, -> {where.not(phone: nil)}

  def strip_all_strings
    ["pid", "name", "phone", "email", "gender", "occupation", "company", "i_e_program_type", "i_e_center", "i_e_teacher"]
      .each do |atr|

        atr_value = instance_eval(atr)
        self.send("#{atr}=", atr_value.strip) if atr_value
      end
  end

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", 'pin_code_id']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
