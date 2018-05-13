class DeleteExtraFieldsFromProgramParticipants < ActiveRecord::Migration[5.1]
  def change
    remove_column :program_participants, :batch
  end
end
