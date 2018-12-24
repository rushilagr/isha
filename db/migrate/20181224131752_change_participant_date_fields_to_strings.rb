class ChangeParticipantDateFieldsToStrings < ActiveRecord::Migration[5.1]
  def change
    change_column :participants, :dob, :string
    change_column :participants, :shoonya_date, :string
    change_column :participants, :bsp_date, :string
    change_column :participants, :silence_date, :string
    change_column :participants, :hata_yoga_date, :string
  end
end
