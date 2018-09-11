class Circle < ApplicationRecord
  has_many :sectors

  validates :name, :presence => true, uniqueness: true
  validates :coordinator, :presence => true

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
