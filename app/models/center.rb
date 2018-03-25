class Center < ApplicationRecord
  belongs_to :city
  has_many :programs
  
  validates :name, :presence => true, uniqueness: true
end
