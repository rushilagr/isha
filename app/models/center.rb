class Center < ApplicationRecord
  has_many :pin_codes
  belongs_to :sector

  validates :name, :presence => true, uniqueness: true
end
