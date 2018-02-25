class AddForeignKeysToProgram < ActiveRecord::Migration[5.1]
  def change
    add_reference :programs, :center, foreign_key: true
    add_reference :programs, :user, foreign_key: true
  end
end
