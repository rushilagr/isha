class CreateTempParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :temp_participants do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :pincode
      t.string :gender
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
