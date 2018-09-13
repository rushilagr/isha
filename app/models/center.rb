class Center < ApplicationRecord
  has_many :pin_codes
  belongs_to :sector

  validates :name, :presence => true, uniqueness: true

  scope :presentable, -> {where.not(name: 'DUMMY')}

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", 'sector_id']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
