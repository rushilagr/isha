class City < ApplicationRecord
  has_many :centers
  has_many :users

  validates :name, :presence => true, uniqueness: true
end
