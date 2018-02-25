class Center < ApplicationRecord
  belongs_to :city
  has_many :programs
end
