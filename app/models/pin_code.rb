class PinCode < ApplicationRecord
  has_many :participants
  belongs_to :center
end
