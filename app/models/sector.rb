class Sector < ApplicationRecord
  has_many :centers
  belongs_to :circle

  validates :name, :presence => true, uniqueness: true
  validates :coordinator, :presence => true
end
