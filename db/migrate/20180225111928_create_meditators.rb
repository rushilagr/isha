class CreateMeditators < ActiveRecord::Migration[5.1]
  def change
    create_table :meditators do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :pin_code
      t.string :gender
      t.string :status
      t.string :occupation

      t.timestamps
    end
  end
end
