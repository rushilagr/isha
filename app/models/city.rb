class City < ApplicationRecord
  has_many :centers
  has_many :users
end
