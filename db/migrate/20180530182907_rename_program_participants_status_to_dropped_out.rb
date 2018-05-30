class RenameProgramParticipantsStatusToDroppedOut < ActiveRecord::Migration[5.1]
  def change
    remove_column :program_participants, :status
    add_column :program_participants, :dropped_out, :date
  end
end
