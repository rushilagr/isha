class CreatePinCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :pin_codes do |t|
      t.string :string
      t.string :state
      t.float :lat
      t.float :lng
      t.references :center, foreign_key: true

      t.timestamps
    end
  end
end
