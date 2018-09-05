class Participant < ApplicationRecord

  validates :pid, presence: true, numericality: true
  validates :name, presence: true
  validates :phone, presence: true
  validates_date :dob

  validates :first_program, presence: true
  validates :first_program_teacher, presence: true
  validates_date :first_program_date
  validates_date :shoonya_date, allow_blank: true
  validates_date :bsp_date, allow_blank: true
  validates_date :silence_date, allow_blank: true
  validates_date :hata_yoga_date, allow_blank: true
end
