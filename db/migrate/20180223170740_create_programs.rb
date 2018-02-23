class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.datetime :started_at 
      t.datetime :ended_at 
      
      t.integer :program_length
      t.string :batches
      t.string :program_status
      t.string :teachers

      # t.references :city, foreign_key: true
      # t.references :center, foreign_key: true
      # t.references :user, foreign_key: true
    end
  end
end
