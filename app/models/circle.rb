class Circle < ApplicationRecord
  has_many :sectors

  validates :name, :presence => true, uniqueness: true
  validates :coordinator, :presence => true
end
