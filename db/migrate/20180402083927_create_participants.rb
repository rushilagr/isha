class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :pincode
      t.string :gender
      t.string :occupation

      t.timestamps
    end
  end
end
