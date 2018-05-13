class AddProgramIdToTempParticipant < ActiveRecord::Migration[5.1]
  def change
    add_reference :temp_participants, :program, foreign_key: true
  end
end
