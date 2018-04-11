class CreateProgramParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :program_participants do |t|
      t.references :participant, foreign_key: true
      t.references :program, foreign_key: true
      t.string :batch
      # t.datetime :date
      t.string :status

      t.timestamps
    end
  end
end
