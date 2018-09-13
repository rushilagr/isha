class Sector < ApplicationRecord
  has_many :centers
  belongs_to :circle

  validates :name, :presence => true, uniqueness: true

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", 'circle_id']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
