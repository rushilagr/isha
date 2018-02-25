class CreateMeditatorsProgramsAttendance < ActiveRecord::Migration[5.1]
  def change
    create_table :meditators_programs_attendances do |t|
      t.references :meditator, foreign_key: true
      t.references :program, foreign_key: true
      
      t.string :batch
      t.datetime :date
    end
  end
end
