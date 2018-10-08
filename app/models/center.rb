class Center < ApplicationRecord
  has_many :pin_codes
  has_many :participants, through: :pin_codes
  belongs_to :sector

  validates :name, :presence => true, uniqueness: true

  scope :presentable, -> {where.not(name: 'Unknown')}

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", 'sector_id']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def last_x_ie_dates x
    participants.select(:i_e_date).map(&:i_e_date).uniq.sort.reverse.first(x)
  end
end
