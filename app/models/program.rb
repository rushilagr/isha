require 'digest/bubblebabble'

class Program < ApplicationRecord
  before_validation :set_digest
  self.inheritance_column = :_type_disabled

  belongs_to :user
  belongs_to :center
  has_many :program_participants
  has_many :participants, through: :program_participants
  has_many :temp_participants
  has_many :attendances, through: :program_participants

  def self.type_enum
    ['Yogasanas', 'Bhuta Shuddhi', 'Inner Engineering - 4 Days', 'Surya Kriya', 'Inner Engineering', 'Angamardana', 'Guru Pooja Training', 'Hatha Yoga 21 Days', 'Isha Yoga for Children']
  end

  # validates_date :starts_at, presence: true, :on_or_after => lambda { Date.current }, on_or_after_message: 'Must be on or after today'
  # validates_date :ends_at, presence: true, on_or_after: :starts_at, on_or_after_message: 'Must be on or after start_date'
  validates :type, presence: true, inclusion: {in: self.type_enum}
  validates :digest, presence: true, uniqueness: true

  def length
    ((ends_at - starts_at)/1.day).to_i + 1
  end

  def self.get_digest data
    schema = Dry::Validation.Form do
      required(:starts_at).filled(:date?)
      required(:ends_at).filled(:date?)
      required(:type).filled(included_in?: Program.type_enum)
      required(:center_id).filled(included_in?: Center.all.pluck(:id))
    end
    data = DryValidate[schema, data]

    Digest::SHA256.bubblebabble data.to_s
  end

  def get_digest
    self.class.get_digest center_id: center.id, starts_at: starts_at.to_date, ends_at: ends_at.to_date, type: type
  end

  def set_digest
    self.digest = get_digest
  end
end
