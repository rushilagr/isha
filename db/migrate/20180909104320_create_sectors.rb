class CreateSectors < ActiveRecord::Migration[5.1]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :coordinator
      t.references :circle, foreign_key: true

      t.timestamps
    end
  end
end
