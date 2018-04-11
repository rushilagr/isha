class CreateParticipantAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :participant_attendances do |t|
      t.references :program_participant, foreign_key: true
      t.string :batch

      t.timestamps
    end
  end
end
