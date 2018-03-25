class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.datetime :starts_at 
      t.datetime :ends_at 
      
      t.integer :length
      t.serialize :batches
      t.string :status
      t.string :teachers
    end
  end
end
