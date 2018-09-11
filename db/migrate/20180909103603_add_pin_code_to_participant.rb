class AddPinCodeToParticipant < ActiveRecord::Migration[5.1]
  def change
    add_reference :participants, :pin_code, foreign_key: true
    remove_column :participants, :pincode
  end
end
