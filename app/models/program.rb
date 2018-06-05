require 'digest/bubblebabble'

class Program < ApplicationRecord
  before_save :set_digest
  self.inheritance_column = :_type_disabled

  belongs_to :user
  belongs_to :center
  has_many :program_participants
  has_many :participants, through: :program_participants
  has_many :temp_participants

  scope :registrable, -> { where('starts_at >= ? AND starts_at <= ?', Date.current, 7.days.from_now).order(:starts_at) }
  scope :attendanceable, -> { where('ends_at >= ?', 7.days.ago).joins(:program_participants).distinct.order(:starts_at) }

  def self.type_enum
    ['Yogasanas', 'Bhuta Shuddhi', 'Inner Engineering - 4 Days', 'Surya Kriya', 'Inner Engineering', 'Angamardana', 'Guru Pooja Training', 'Hatha Yoga 21 Days', 'Isha Yoga for Children']
  end

  validates_date :starts_at, presence: true, :on_or_after => lambda { 7.days.ago }, on_or_after_message: 'Must start within previous 7 days'
  validates_date :ends_at, presence: true, on_or_after: :starts_at, on_or_after_message: 'Must be on or after start_date'
  validates :type, presence: true, inclusion: {in: self.type_enum}

  def length
    ((ends_at - starts_at)/1.day).to_i + 1
  end

  def attendance_percentage
    attending_count = participants.select { |p| p.dropped_out(id) == false }.count
    return 'N/A' if participants.count == 0
    percentage = ((attending_count.to_f / participants.count) * 100).to_i
    percentage.to_s + '%'
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

  def dropped_out_participants
    participants.joins(:program_participants).where.not(program_participants: {dropped_out: nil})
  end

  def ongoing_participants
    participants.joins(:program_participants).where(program_participants: {dropped_out: nil})
  end

end
