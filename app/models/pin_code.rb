class PinCode < ApplicationRecord
  has_many :participants
  belongs_to :center

  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "created_at", 'center_id']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
