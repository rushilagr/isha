class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :pid
      t.string :name
      t.string :phone
      t.string :email
      t.string :gender
      t.string :occupation
      t.string :company
      t.string :pincode
      t.date :dob

      t.string :first_program
      t.string :first_program_center
      t.string :first_program_teacher
      t.date :first_program_date
      t.date :shoonya_date
      t.date :bsp_date
      t.date :silence_date
      t.date :hata_yoga_date

      t.timestamps
    end
  end
end
