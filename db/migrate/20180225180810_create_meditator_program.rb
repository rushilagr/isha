class CreateMeditatorProgram < ActiveRecord::Migration[5.1]
  def change
    create_table :meditator_programs do |t|
      t.references :meditator, foreign_key: true
      t.references :program, foreign_key: true
      t.string :batch
      t.datetime :date
      t.string :status
      t.timestamps
    end
  end
end
