class CreateMeditatorProgramAttendance < ActiveRecord::Migration[5.1]
  def change
    create_table :meditator_program_attendances do |t|
      t.references :meditator, foreign_key: true
      t.references :program, foreign_key: true
      t.string :batch
      t.datetime :date
      t.timestamps
    end
  end
end
