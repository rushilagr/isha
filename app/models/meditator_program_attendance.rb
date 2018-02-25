class MeditatorProgramAttendance < ApplicationRecord
  belongs_to :program
  belongs_to :meditator
end
